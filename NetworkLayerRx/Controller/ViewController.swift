//
//  ViewController.swift
//  NetworkLayerRx
//
//  Created by Douglas Hennrich on 19/07/20.
//  Copyright © 2020 Douglas Hennrich. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiClient.getPosts(userId: 1)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { postsList in
                for post in postsList {
                    print("\n", post.title)
                }
            }, onError: { error in
                
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: disposeBag)
    }

}

