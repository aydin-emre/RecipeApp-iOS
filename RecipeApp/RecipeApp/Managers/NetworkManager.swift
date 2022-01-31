//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Emre on 27.01.2022.
//

import Foundation
import Alamofire
import EAAlert

private let baseURL: String = "https://cookpad.github.io/global-mobile-hiring/api/"

class NetworkManager {

    // MARK: - Shared Manager

    static var shared = NetworkManager()

    var shouldShowLogs = true

    // MARK: - Custom Views

    private var eaAlert: EAAlert?

    private lazy var window = {
       return UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
    }()

    private lazy var loadingView: UIView? = {
        guard let window = self.window else { return nil }
        let windowBounds = window.bounds
        let superview = UIView(frame: windowBounds)
        superview.backgroundColor = UIColor(white: 1, alpha: 0.5)

        let viewLoading = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        viewLoading.center = CGPoint(x: windowBounds.width/2, y: windowBounds.height/2)
        viewLoading.backgroundColor = appColor
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 15, y: 15, width: 20, height: 20))
        if #available(iOS 13.0, *) {
            activityIndicatorView.style = .large
        } else {
            activityIndicatorView.style = .whiteLarge
        }
        activityIndicatorView.startAnimating()
        viewLoading.addSubview(activityIndicatorView)
        viewLoading.layer.cornerRadius = 5
        viewLoading.layer.shadowColor = UIColor.black.cgColor
        viewLoading.layer.shadowOpacity = 0.66
        viewLoading.layer.shadowOffset = CGSize.zero
        viewLoading.layer.shadowRadius = 5
        viewLoading.layer.shadowPath = UIBezierPath(rect: viewLoading.bounds).cgPath
        viewLoading.layer.shouldRasterize = true

        superview.addSubview(viewLoading)

        return superview
    }()

    func request<T: Decodable>(of type: T.Type, for path: String, method: HTTPMethod = .post, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, showLoadingView: Bool = false, completion: @escaping (Decodable?, Error?) -> Void) {
        if showLoadingView,
            let loadingView = loadingView,
            let window = self.window {
            loadingView.isHidden = false
            window.addSubview(loadingView)
        }
        eaAlert = EAAlert(message: "Please check your internet connection!")

        var inlineHeaders: HTTPHeaders = [:]
        inlineHeaders["Accept"] = "*/*"
        inlineHeaders["Content-Type"] = "application/x-www-form-urlencoded"

        if let headers = headers {
            for key in headers.dictionary.keys {
                inlineHeaders[key] = headers[key]
            }
        }

        var inlineParameters: Parameters = [:]

        if let parameters = parameters {
            for key in parameters.keys {
                inlineParameters[key] = parameters[key] as? String
            }
        }

        if shouldShowLogs {
            print("\n---------- URL: ----------\n \(baseURL+path)\n--------------------------\n")
            print("\n------- HEADERS: -------\n \(inlineHeaders)\n--------------------------\n")
            print("\n----- PARAMETERS: -----\n \(inlineParameters)\n--------------------------\n")
        }

        if let networkReachabilityManager = NetworkReachabilityManager(), networkReachabilityManager.isReachable {
            AF.request(baseURL+path,
                       method: method,
                       parameters: inlineParameters,
                       encoding: encoding,
                       headers: inlineHeaders)
                .validate(statusCode: 200..<400)
                .responseDecodable(of: type) { (response) in
                    self.loadingView?.isHidden = true
                    switch response.result {
                    case .success(let value):
                        completion(value, nil)
                        if self.shouldShowLogs {
                            print("\n------- RESPONSE: ------\n \(value)\n--------------------------\n")
                        }
                    case .failure(let error):
                        completion(nil, error)
                        if self.shouldShowLogs {
                            print("\n-------- ERROR: --------\n \(String(describing: error))\n-------------------------\n")
                        }
                    }
                }
        } else {
            loadingView?.isHidden = true
            eaAlert?.show()
        }
    }

}
