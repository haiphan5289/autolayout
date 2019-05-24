//
//  ViewController.swift
//  AutolayoutCode
//
//  Created by HaiPhan on 5/24/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewDo : UIView! = UIView()
    var viewanchor: UIView!
//    var childView: UIView = {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .darkGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    var visualformat: UIView!
    var visualformat2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        createviewdo()
//        createanchor()
//        setupLayout()
        createavisual()
    }
    //Các autolayout có thể hỗ trợ nhau
    //Autolayout = visual
    func createavisual(){
        visualformat = UIView(frame: .zero)
        visualformat.backgroundColor = .green
        visualformat.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(visualformat)
        visualformat2 = UIView(frame: .zero)
        visualformat2.backgroundColor = .gray
        visualformat2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(visualformat2)
        let width = self.view.frame.size.width / 2
        //Cấu hình visual
        //Visualformat có cấu hình là: V(vetical) or H(horzintal)
        //Visualformat: "V:|[v0]|" << nghĩa là cạnh trên & cạnh dưới sát view
        //Visualformat: "V:|-50-[v0]-50-|" << nghĩa là 2 cạnh trên dưới cách 50
        //Visualformat: "V:[v0(200)]" << mặc định sát cạnh trên và chiêuf dài 200
        //Visualformat: V:[v0(200)]-50-| << chiều dài 200 và sát cạnh dưới 50
        //Visualformat: "V:|[v0][v1]|" <<< view 0 trước view 1, 2 view sẽ = height
        //visualformat: "V:[v0(100)]" <<< view 0 có height = 100, còn lại là view 2
        //visualformt: "H:|[v0(200)]|, v0 = view1 <<< chiều ngang view1 = 200
        //visualformt: "H:|[v0(100)]|, v0 = view2 <<< chiều ngang view2 = 200
        //Auto 2 view
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": visualformat, "v1": visualformat2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(100)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": visualformat]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1": visualformat2]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v1": visualformat]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": visualformat as Any]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0" + "(\(width))" + "]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": visualformat as Any]))
//        visualformat.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
    }
    //Autolayout = anchor
    func createanchor(){
        viewanchor = UIView(frame: .zero)
        viewanchor.backgroundColor = .gray
        viewanchor.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewanchor)
        viewanchor.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        viewanchor.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewanchor.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  1).isActive = true
        viewanchor.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
    }
    //    func setupLayout() {
    //        view.addSubview(childView)
    //        childView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    //        childView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    //        childView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //        childView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
    //    }
    
    //Autolayout = LayoutContraints
    func createviewdo(){
        viewDo.backgroundColor = .blue
        // bắt buộc phải có
        viewDo.translatesAutoresizingMaskIntoConstraints = false
        //attribute phải = nhau
        let positionx = NSLayoutConstraint(item: viewDo as Any, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1, constant: 100)
        let positiony = NSLayoutConstraint(item: viewDo as Any, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 100)
        let width = NSLayoutConstraint(item: viewDo as Any, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: viewDo as Any, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        self.view.addSubview(viewDo)
        self.view.addConstraints([positionx,positiony,width,height])
    }


}

