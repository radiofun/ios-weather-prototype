//
//  WeatherAppViewController.swift
//  weather-app
//
//  Created by Jonathon Toon on 8/26/15.
//  Copyright (c) 2015 Jonathon Toon. All rights reserved.
//

import UIKit

class WeatherAppViewController: UIViewController, UIScrollViewDelegate {

    var weatherScroll: UIScrollView!
    var todayScroll: UIScrollView!
    var chromeView: UIImageView!
    var amsterdamView: UIImageView!
    var temperatureView: UIImageView!
    
    var previousScrollPosition: CGFloat! = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Create the background sky and add it to the view controller
        let background = UIImageView(image: UIImage(named: "background"))
        self.view.addSubview(background)
    
        
        let weatherScrollContainer = UIView(frame:
            CGRectMake(0, 210, self.view.frame.size.width, self.view.frame.size.height - 210)
        )
            weatherScrollContainer.clipsToBounds = true
        self.view.addSubview(weatherScrollContainer)
        
        // Create the image view out main vertical scroll view, then added it to a UIScrollView
        let weatherView = UIImageView(image: UIImage(named: "weather"))
        
        self.weatherScroll = UIScrollView(frame:
            CGRectMake(0, 0, weatherScrollContainer.frame.size.width, weatherScrollContainer.frame.size.height)
        )
        self.weatherScroll.contentSize = weatherView.frame.size
        self.weatherScroll.contentInset = UIEdgeInsetsMake(90, 0, 60, 0)
        self.weatherScroll.contentOffset.y = -90
        self.weatherScroll.showsVerticalScrollIndicator = false
        self.weatherScroll.delegate = self
        self.weatherScroll.addSubview(weatherView)
        
        weatherScrollContainer.addSubview(self.weatherScroll)
       
        // Initialize the previous scroll position variable
        self.previousScrollPosition = self.weatherScroll.contentOffset.y
        
        // Create the image view then add it to the horizontal UIScrollView
        let todayView = UIImageView(image: UIImage(named: "today"))
            todayView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.todayScroll = UIScrollView(frame:
            CGRectMake(0, 325, self.view.frame.size.width, 100)
        )
        self.todayScroll.contentInset = UIEdgeInsetsMake(0, -100, 0, 0)
        self.todayScroll.contentSize = todayView.image!.size
        self.todayScroll.showsHorizontalScrollIndicator = false
        self.todayScroll.addSubview(todayView)
        
        self.view.addSubview(todayScroll)
        
        // Day header image view
        self.chromeView = UIImageView(image:
            UIImage(named: "chrome")
        )
        self.chromeView.contentMode = UIViewContentMode.ScaleAspectFill
        self.chromeView.frame = CGRectMake(15, self.todayScroll.frame.origin.y - self.chromeView.frame.size.height-2, self.chromeView.frame.size.width, self.chromeView.frame.size.height)
        
        self.view.addSubview(self.chromeView)
        
        // Create image view for our amsterdam header
        self.amsterdamView = UIImageView(image:
            UIImage(named: "amsterdam")
        )
        self.amsterdamView.frame = CGRectMake(self.view.frame.size.width/2 - self.amsterdamView.frame.size.width/2, 80, self.amsterdamView.frame.size.width, self.amsterdamView.frame.size.height)
        
        self.view.addSubview(self.amsterdamView)
        
        // Create image for our temperature text
        self.temperatureView = UIImageView(image: UIImage(named: "temperature"))
        self.temperatureView.frame = CGRectMake((self.view.frame.size.width/2 - self.temperatureView.frame.size.width/2) + 8, 150, self.temperatureView.frame.size.width, self.temperatureView.frame.size.height)
        self.view.addSubview(self.temperatureView)
        
        // Create bottom tabbar image
        let bottomBar = UIImageView(image: UIImage(named: "bottombar"))
            bottomBar.frame = CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)
        
        self.view.addSubview(bottomBar)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.repositionScrollView(scrollView)
    }

    func repositionScrollView(scrollView: UIScrollView) {
        if scrollView == self.weatherScroll {
            
            if scrollView.contentOffset.y < 120 {
                
                self.todayScroll.frame.origin.y -= (scrollView.contentOffset.y - self.previousScrollPosition)
                
                self.chromeView.frame.origin.y -= (scrollView.contentOffset.y - self.previousScrollPosition)
                self.chromeView.alpha = self.mapRange(self.chromeView.frame.origin.y, r1: 300.0, r2: 200.0, t1: 1.0, t2: 0.0)
                
                self.amsterdamView.frame.origin.y = self.mapRange(self.todayScroll.frame.origin.y, r1: 325.0, r2: 115.0, t1: 80.0, t2: 35.0)
                
                self.temperatureView.frame.origin.y = self.mapRange(self.todayScroll.frame.origin.y, r1: 325.0, r2: 115.0, t1: 150.0, t2: 50.0)
                self.temperatureView.alpha = self.chromeView.alpha
                
                self.previousScrollPosition = scrollView.contentOffset.y
                
            } else if scrollView.contentOffset.y > 120 {
                
                self.todayScroll.frame.origin.y = 115
                
                self.chromeView.frame.origin.y = 90
                self.chromeView.alpha = 0.0
                
                self.previousScrollPosition = 120
                
            }
        }
    }
    
    func mapRange(v:CGFloat, r1:CGFloat, r2:CGFloat, t1:CGFloat, t2:CGFloat) -> CGFloat {
        let norm: CGFloat = (v-r1)/(r2-r1)
        return (t1*(1-norm) + t2*norm)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

