//
//  WorkoutResultsViewController.swift
//  FitnessApp
//
//  Created by Станислав Витальевич on 05.03.2025.
//

import UIKit
import Lottie

class WorkoutResultsViewController: UIViewController {

    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var submitButton: ShadowButton!
    @IBOutlet weak var trophyAnimationView: LottieAnimationView!
    
    weak var workoutDelegate: WorkoutDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congratulationsLabel.font = UIFont.style(.title)
        submitButton.setTitle("Submit", for: .normal)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        resultsView.layer.cornerRadius = 6
    }

    func startAnimation() {
        trophyAnimationView.animation = LottieAnimation.named("trophy")
        trophyAnimationView.loopMode = .playOnce //  говорим чтобы отображалось только один раз
        trophyAnimationView.contentMode = .scaleAspectFit
        trophyAnimationView.play()
    }
    
    @IBAction func submitButtonTapped(_ sender: ShadowButton) {
        dismiss(animated: true) {
            self.workoutDelegate?.dismissWorkout()  // Закрываем предыдущий Controller 
        }
    }
    
}
