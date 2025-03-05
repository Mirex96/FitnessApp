//
//  WorkoutViewController.swift
//  FitnessApp
//
//  Created by Станислав Витальевич on 04.03.2025.
//

import UIKit
import Lottie

protocol WorkoutDelegate: AnyObject {
    func dismissWorkout()
}

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var ringView: RingView!
    var program: Program!
    var currentExcerciseIndex = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkoutResultsSegue" {
            let destinationVC = segue.destination as! WorkoutResultsViewController
            destinationVC.workoutDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ringView.delegate = self
        ringView.progress = 0
    }
    
    // Метод, отвечающий за загрузку упражнения
    func loadExcercise() {
        ringView.progress = 0
        let excercise =  program.excercises[currentExcerciseIndex]
        // создаем анимацию и говорим, что нужно показать в ней и на какое время
        ringView.startAnimation(time: excercise.duration)
        animationView.animation = LottieAnimation.named(excercise.animation)
        animationView.loopMode = .loop //  зацикливаем анимацию, чтобы она не прерывалась
        animationView.contentMode = .scaleAspectFit // масштабируем анимацию под нашу View
        animationView.play() // запускаем анимацию
    }
    
    // Запускаем анимацию
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadExcercise()
    }
   
}

extension WorkoutViewController: RingViewDelegate {
    
    func animationDidEnd() {
        if program.excercises.count - 1  == currentExcerciseIndex {
            animationView.stop()  // чтобы анимация не повторялась в том момент, когда идет другая анимация
            performSegue(withIdentifier: "WorkoutResultsSegue", sender: nil) // после завершения тренировки открываем другое окно и показываем результат
            return
        }
        currentExcerciseIndex += 1
        loadExcercise()
    }
    
}

extension WorkoutViewController: WorkoutDelegate {
    
    // Метод закрытия Сontroller после показа результатов выполнения тренировки
    func dismissWorkout() {
        dismiss(animated: true)
    }
    
}
