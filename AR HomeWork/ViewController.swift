//
//  ViewController.swift
//  AR HomeWork
//
//  Created by Evgeniy Ryshkov on 14.09.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    func addDebugOption(_ option: SCNDebugOptions) {
        
        sceneView.debugOptions.insert(option)
    }
    
    func removeDebugOption(_ option: SCNDebugOptions) {
        
        sceneView.debugOptions.remove(option)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, .showFeaturePoints, .showBoundingBoxes]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
    
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        func switchButton (_ option: SCNDebugOptions) {
            if sender.tag == 0 {
                addDebugOption(option)
                sender.tag = 1
                sender.setTitleColor(.yellow, for: .normal)
            }else {
                removeDebugOption(option)
                sender.tag = 0
                sender.setTitleColor(.blue, for: .normal)
            }
        }
        
        switch sender.titleLabel?.text {
        case "showBoundingBoxes":
            switchButton(.showBoundingBoxes)
        case "showWorldOrigin":
            switchButton(.showWorldOrigin)
        case "showFeaturePoints":
            switchButton(.showFeaturePoints)
        case "renderAsWireframe":
            switchButton(.renderAsWireframe)
        case "showWireframe":
            switchButton(.showWireframe)
        case "showLightInfluences":
            switchButton(.showLightInfluences)
        default:
            break
        }
    }
    
}
