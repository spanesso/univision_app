//
//  youtubeappTests.swift
//  youtubeappTests
//
//  Created by Sebastian Panesso on 29/6/21.
//

import XCTest
@testable import youtubeapp

class youtubeappTests: XCTestCase {
    
    let jsonVideoList = "{\"kind\":\"youtube#videoListResponse\",\"etag\":\"ILDIBU9PKV9S7NtfoE0kQQ_VJbM\",\"items\":[{\"kind\":\"youtubeideo\",\"etag\":\"jSt8L7hs5VGSKLfxcg2iDyoVyCI\",\"id\":\"BH6T3CTuncc\",\"snippet\":{\"publishedAt\":\"2021-06-30T22:00:09Z\",\"channelId\":\"UCmS75G-98QihSusY7NfCZtw\",\"title\":\"Nicky Jam  \",\"description\":\"Nicky Jam || BZRP Music Sessions \",\"thumbnails\":{\"default\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/maxresdefault.jpg\",\"width\":1280,\"height\":720}}}},{\"kind\":\"youtubeideo\",\"etag\":\"jSt8L7hs5VGSKLfxcg2iDyoVyCI\",\"id\":\"BH6T3CTuncc\",\"snippet\":{\"publishedAt\":\"2021-06-30T22:00:09Z\",\"channelId\":\"UCmS75G-98QihSusY7NfCZtw\",\"title\":\"Nicky Jam  \",\"description\":\"Nicky Jam || BZRP Music Sessions \",\"thumbnails\":{\"default\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/maxresdefault.jpg\",\"width\":1280,\"height\":720}}}},{\"kind\":\"youtubeideo\",\"etag\":\"jSt8L7hs5VGSKLfxcg2iDyoVyCI\",\"id\":\"BH6T3CTuncc\",\"snippet\":{\"publishedAt\":\"2021-06-30T22:00:09Z\",\"channelId\":\"UCmS75G-98QihSusY7NfCZtw\",\"title\":\"Nicky Jam  \",\"description\":\"Nicky Jam || BZRP Music Sessions \",\"thumbnails\":{\"default\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/maxresdefault.jpg\",\"width\":1280,\"height\":720}}}},{\"kind\":\"youtubeideo\",\"etag\":\"jSt8L7hs5VGSKLfxcg2iDyoVyCI\",\"id\":\"BH6T3CTuncc\",\"snippet\":{\"publishedAt\":\"2021-06-30T22:00:09Z\",\"channelId\":\"UCmS75G-98QihSusY7NfCZtw\",\"title\":\"Nicky Jam  \",\"description\":\"Nicky Jam || BZRP Music Sessions \",\"thumbnails\":{\"default\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https://i.ytimg.com/vi/BH6T3CTuncc/maxresdefault.jpg\",\"width\":1280,\"height\":720}}}}]}"
    
    var viewModel:VideosViewModel!

    override func setUpWithError() throws {
        viewModel = VideosViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func testGetVideoList(){
        if let videoList = viewModel.parseToYoutubeVieoList(json: jsonVideoList) as?  [YoutubeVideo]{
            XCTAssert(videoList.count==4)
        }
    }
     
}
