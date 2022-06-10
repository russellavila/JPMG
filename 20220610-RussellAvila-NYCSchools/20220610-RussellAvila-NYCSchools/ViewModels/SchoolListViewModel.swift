//
//  SchoolListViewModel.swift
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

import Foundation

protocol SchoolListViewModelType {
    func bind(updateHandler: @escaping () -> Void)
    func getSchools()
    var count: Int { get }
    func getSchoolName(index: Int) -> String?
    func getSchoolID(index: Int) -> String?
    func getSATReading(index: Int) -> String?
    func getSATMath(index: Int) -> String?
    func getSATWriting(index: Int) -> String?
}

class SchoolListViewModel: SchoolListViewModelType {
    
    var schools: [WelcomeElement] {
        didSet {
            self.updateHandler?()
        }
    }
    
    let dataFetcher: DataFetcher
    
    var updateHandler: (() -> Void)?
    
    init(schools: [WelcomeElement] = [], dataFetcher: DataFetcher = NetworkManager()) {
        self.schools = schools
        self.dataFetcher = dataFetcher
    }
    
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    func getSchools() {
        self.dataFetcher.fetchModel(url: URL( string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")) { [weak self] (result: Result<PageResult, Error>) in
            switch result {
            case .success(let page):
                self?.schools.append(contentsOf: page)
                print(page)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var count: Int {
        return self.schools.count
    }
    
    func getSchoolName(index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.schools[index].schoolName
    }
    
    func getSchoolID(index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.schools[index].dbn
    }
    
    func getSATMath(index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.schools[index].satMathAvgScore
    }
    
    func getSATReading(index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.schools[index].satCriticalReadingAvgScore
    }
    
    func getSATWriting(index: Int) -> String?{
        guard index < self.count else { return nil }
        return self.schools[index].satWritingAvgScore
    }
}
