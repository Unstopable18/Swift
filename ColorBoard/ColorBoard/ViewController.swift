//  ViewController.swift
//  ColorBoard
//
//  Created by CEMTREX on 11/09/23.
    

    import UIKit

    class ViewController: UIViewController{
        var colors:[UIColor]=[]
        
        enum Cells{
            static let colorCell="ColorCell"
        }
        
        enum Segue{
            static let toDetail="ToDetailColorView"
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            addRandomColors()
        }

        func addRandomColors(){
            for _ in 0..<50{
                colors.append(.random())
            }
        }

        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destViewController=segue.destination as! DetailViewController
            destViewController.color=sender as? UIColor
        }

    }



    extension ViewController:UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return colors.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell=tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
                return UITableViewCell()
            }
            cell.backgroundColor=colors[indexPath.row]
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            let color=colors[indexPath.row]
            performSegue(withIdentifier: Segue.toDetail, sender: color)
        }

    }



