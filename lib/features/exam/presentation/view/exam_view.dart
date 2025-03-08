import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/assets/app_images.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/domain/entities/exam_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'score_view.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key});

  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedOption;
  late Timer _timer;
  int _timeLeft = 150;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        _timer.cancel();
        _showTimeOutDialog();
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  void _showTimeOutDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.sandClockImage,height: 68,width: 45,),
            Text(LocaleKeys.Subjects_TimeOut.tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.red,fontWeight: FontWeight.w400,fontSize: 24),),
          ],
        ),
         actionsAlignment: MainAxisAlignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScoreView(
                            score: _score,
                            total: questions.length,
                            questions: questions,
                
                          )));
                    },
                  child: Text(LocaleKeys.Subjects_ViewScore.tr()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _submitAnswer() async {
    if (_selectedOption == null) return;
    if (_selectedOption == questions[_currentQuestionIndex].correctAnswer) {
      _score++;
    }
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _progressValue = (_currentQuestionIndex) / questions.length;
      });
    } else {
      _timer.cancel();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('score', _score);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScoreView(
              score: _score,
              total: questions.length,
              questions: questions,
            )),
      );
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _progressValue = (_currentQuestionIndex) / questions.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(LocaleKeys.Subjects_Exam.tr(),
          style:  Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
          actions: [
            Image.asset(AppImages.alarmImage,height: 30,width: 24,),
            SizedBox(width: 10,),
            Text(
              _formatTime(_timeLeft),
              style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.green),
            ),
            SizedBox(width: 10,),
        ],),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "Question ${_currentQuestionIndex + 1} of ${questions.length}",
              style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500),
            ),
            Slider(
              value: _progressValue,
              min: 0,
              max: 1,
              divisions: questions.length - 1,
              label: "${((_progressValue) * 100).toStringAsFixed(1)}%",
              onChanged: null,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  questions[_currentQuestionIndex].questionText,
                  style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions[_currentQuestionIndex].options.length,
                itemBuilder: (context, index) {
                  String option = questions[_currentQuestionIndex].options[index];
                  bool isSelected = option == _selectedOption;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? AppColors.blue[10] : AppColors.lightBlue,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      activeColor: AppColors.blue,
                      groupValue: _selectedOption,
                      onChanged: (value) => setState(() => _selectedOption = value),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )),
                      side: WidgetStatePropertyAll(BorderSide(color: AppColors.blue),),
                      backgroundColor:WidgetStatePropertyAll(AppColors.white),
                    ),
                    onPressed: _currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                    child: Text(LocaleKeys.Subjects_Back.tr(),
                        style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blue,fontWeight: FontWeight.w600,)),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )),
                    ),
                    onPressed: _submitAnswer,
                    child: Text(LocaleKeys.Subjects_Next.tr(),
                        style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white,fontWeight: FontWeight.w600,)),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 20,),
          ],
        ),
      ),
    );
  }
}