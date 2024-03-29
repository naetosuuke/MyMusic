//
//  ViewController.swift
//  MyMusic
//
//  Created by Daisuke Doi on 2022/11/27.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //共通のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int) {
        do{
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    
    
    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    //シンバル用のプレイヤーインスタンス生成
    var cymbalPlayer = AVAudioPlayer()
    
    @IBAction func cymbal(_ sender: Any) {
      
        /* リファクタ前-----------------------------
       do {
            //シンバル用のプレイヤーに、音源ファイル名を指定
            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
            
            //シンバルの音源再生
            cymbalPlayer.play()
        } catch {
            print("シンバルで エラーが発生しました！")
        }
       *///リファクタ後-----------------------------
        
        
        // "&"は参照渡し、引数に指定した変数に変更を加えたい場合に指定できる
        // 今回は　　player.numberOfLoops = count に 0 を設定するため利用
        soundPlayer(player: &cymbalPlayer ,path: cymbalPath, count: 0)
    }
    
    
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    //ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    @IBAction func guitar(_ sender: Any) {
        
        /*リファクタ前-----------------------------
        do {
            //ギター用のプレイヤーに、音源ファイル名を指定
            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
            
            //ギターの音源再生
            guitarPlayer.play()
        } catch {
            print("ギターで エラーが発生しました！")
        }
        *///リファクタ後-----------------------------
        
        soundPlayer(player: &guitarPlayer ,path: guitarPath, count: 0)
    }
    
    //バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    //バックミュージック用のプレイヤーインスタンスを生成
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any) {
        
        /*リファクタ前-----------------------------
        do{
            //バックミュージック用のプレイヤーに、音源ファイル名を指定
            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
            
            //リピート設定 -1だと無限再生
            backmusicPlayer.numberOfLoops = -1
            backmusicPlayer.play()
            
        } catch {
            print("エラーが 発生しました!")
        }
        *///リファクタ後-----------------------------
        
        soundPlayer(player: &backmusicPlayer ,path: backmusicPath, count: -1)
    }
    
    @IBAction func stop(_ sender: Any) {
            //バックミュージック停止
            backmusicPlayer.stop()
    }
    
    
    
    
    
    
    
}

