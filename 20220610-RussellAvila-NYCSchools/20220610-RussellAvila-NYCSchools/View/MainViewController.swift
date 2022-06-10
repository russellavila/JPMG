//
//  ViewController.swift
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

import UIKit

//Simple view model with a TableView as per MVVM archetecture.
//Navigation to detail screen done by delegate.

//The cell is done using objective C. NYCell
//The rest is coded in regular Swift by MVVM.
//A couple XIUC tests are provided.

class MainViewController: UIViewController {
    
    lazy var mainTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.dataSource = self
        table.delegate = self
        table.prefetchDataSource = self
        table.register(NYCell.self, forCellReuseIdentifier: "NYCell")
        return table
    }()
    
    var schoolListViewModel: SchoolListViewModelType
   
    init(viewModel: SchoolListViewModelType) {
        self.schoolListViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
        self.schoolListViewModel.bind { [weak self] in
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
        self.schoolListViewModel.getSchools()
    }
    
    private func setUpUI() {
        self.title = "School Names"
        self.view.backgroundColor = .white
        self.view.addSubview(self.mainTableView)
        self.mainTableView.bindToSuperView(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolListViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NYCell", for: indexPath) as? NYCell else {
            return UITableViewCell()
        }
        cell.schoolName?.text = self.schoolListViewModel.getSchoolName(index: indexPath.row)
        cell.schoolID?.text = "Database ID \n" + (self.schoolListViewModel.getSchoolID(index: indexPath.row) ?? "Not fetched")
        
        //for simple XUIC testing
        cell.schoolName?.accessibilityIdentifier = "Section: \(indexPath.section), row: \(indexPath.row)"
        
        return cell
    }
    
}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    //didn't paginate since fetched data is just text.
    //makes like 500 cells here by the number of schools in New York
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.schoolListViewModel.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        self.schoolListViewModel.getSchools()
    } 
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        //detail screen information passed here
        detailVC.schoolLabel.text = (self.schoolListViewModel.getSchoolName(index: indexPath.row) ?? "error") + "\n\n"
        detailVC.satMathLabel.text = "Average Math SAT: " + (self.schoolListViewModel.getSATMath(index: indexPath.row) ?? "error") + "\n\n"
        detailVC.satReadingLabel.text = "Average Reading SAT: " + (self.schoolListViewModel.getSATReading(index: indexPath.row) ?? "error") + "\n\n"
        detailVC.satWritingLabel.text = "Average Writing SAT: " + (self.schoolListViewModel.getSATWriting(index: indexPath.row) ?? "error") + "\n\n"
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

