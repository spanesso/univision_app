//
//  VideosViewController.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//


import Foundation
import UIKit
import AVKit
import RxSwift
import RxCocoa
import WebKit

enum TypeView {
    case FILTER
    case SEARCH
}


class VideosViewController: BaseViewController {
    
    static let key = "Videos"
    
    var viewType:TypeView!
    
    @IBOutlet weak var searchFilterBar: UISearchBar!
    @IBOutlet weak var tableVideoList: UITableView!
    
    
    let viewModel = VideosViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        binding()
        loadInitialView()
        
    }
    
    private func loadInitialView(){
        if viewType == TypeView.FILTER{
            viewModel.getLatestVideos()
        }
    }
    
    private func binding(){
        bindTableView()
        bindSearchBar()
    }
    
    private func layout(){
        searchFilterBar.placeholder = viewType == .FILTER ? Constants.app.filterPlaceHolder : Constants.app.searchPlaceHolder
        tableVideoList.register(
            UINib(nibName: LatestVideoCell.key, bundle: nil),forCellReuseIdentifier: LatestVideoCell.key)
    }
    
    private func presentVideo(index:Int){
        
        var videoId = ""
        
        if viewType == TypeView.FILTER{
            
            let youtubeVideo = viewModel.cachedLatestVideos[index]
            if let youtubeVideoID = youtubeVideo.id as? String{
                videoId = youtubeVideoID
            }
        }else{
            let youtubeVideo = viewModel.searchedVideos.value[index]
            if let youtubeVideoID = youtubeVideo.id!.videoId as? String{
                videoId = youtubeVideoID
            }
        }
        
        self.addPlayerViewFrom(videoId)
    }
    
    private func bindTableView() {
        
        if viewType == TypeView.FILTER{
            viewModel.latestVideos.asObservable()
                .bind(to:tableVideoList.rx.items) {
                    (tableView, row, element) in
                    
                    let indexPath = IndexPath(row: row, section: 0)
                    let cell = tableView.dequeueReusableCell(withIdentifier: LatestVideoCell.key, for: indexPath) as! LatestVideoCell
                    cell.loadData(video: element)
                    
                    return cell
                }.disposed(by: disposeBag)
        }else{
            viewModel.searchedVideos.asObservable()
                .bind(to:tableVideoList.rx.items) {
                    (tableView, row, element) in
                    
                    let indexPath = IndexPath(row: row, section: 0)
                    let cell = tableView.dequeueReusableCell(withIdentifier: LatestVideoCell.key, for: indexPath) as! LatestVideoCell
                    cell.loadSSearchedData(video: element)
                    
                    return cell
                }.disposed(by: disposeBag)
        }
        
        tableVideoList.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.hideKeyBoard()
                self?.presentVideo(index:indexPath.row)
            }).addDisposableTo(disposeBag)
        
        tableVideoList.rx.setDelegate(self)
    }
    
    
    private func bindSearchBar() {
        if viewType == TypeView.FILTER{
            
            searchFilterBar.rx.text.asObservable()
                .filter{$0 != nil}
                .subscribe(onNext: {
                    text in
                    if let filterText  = text as? String {
                        if filterText.isEmpty{
                            self.hideKeyBoard()
                        }else{
                            self.viewModel.filter(text: filterText)
                        }
                    }
                }).disposed(by: disposeBag)
        }else{
            
            searchFilterBar.rx.searchButtonClicked.subscribe(onNext: {
                text in
                if let word = self.searchFilterBar.text as? String{
                    if word.count > 3 {
                        self.hideKeyBoard()
                        if let utf8Text = self.searchFilterBar.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
                            self.viewModel.searchByWord(text: utf8Text)
                        }
                        
                    }
                }
            }).disposed(by: disposeBag)
        }
    }
    
}

extension VideosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LatestVideoCell.height
    }
}


