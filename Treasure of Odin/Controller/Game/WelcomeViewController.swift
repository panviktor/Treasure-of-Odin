import UIKit

class WelcomeViewController: UIViewController {
    let rootView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Background2"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coinImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "coin"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "playButton"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGUI()
        coinImage.pulsate(100)
        playButton.pulsate(100)
    }
    
    private func loadGUI() {
        view.addSubview(rootView)
        rootView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rootView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rootView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        rootView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(coinImage)
        coinImage.widthAnchor.constraint(equalToConstant: 450).isActive = true
        coinImage.heightAnchor.constraint(equalToConstant: 450).isActive = true
        coinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coinImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true

        view.addSubview(playButton)
        playButton.topAnchor.constraint(equalTo: coinImage.bottomAnchor, constant: 25).isActive = true
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc private func buttonAction() {
        launchTheGame()
    }
    
    private func launchTheGame() {
        let sb = UIStoryboard(name: "Game", bundle: .main)
        let navigationVC = sb.instantiateInitialViewController() ?? UIViewController()
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true, completion: nil)
    }
}

