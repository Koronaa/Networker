import XCTest
@testable import Networker

final class NetworkerTests: XCTestCase {
    
    var sut:APIManager!
    var config:ConfigurationManager!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        config = ConfigurationManager.shared
        config?.setSession(using: URLSessionConfiguration.default)
        sut = APIManager()
        
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        config = nil
    }
    
    
    func testAPISuccess() async throws{
        let users = try await sut!.makeRequest(with: MockRequest.getUsers, for: Users.self)
        XCTAssertNotNil(users)
    }
    
    func testAPINotFound() async {
        do{
            let _ = try await sut!.makeRequest(with: MockRequest.getName, for: Users.self)
        }catch(let e){
            XCTAssertEqual(e.localizedDescription, APIError.NotFound.localizedDescription)
        }
    }
    
    func testDecodeError() async {
        do{
            let _ = try await sut!.makeRequest(with: MockRequest.getUsers, for: User.self)
        }catch(let e){
            XCTAssertTrue(e.localizedDescription.contains("The data couldn’t be read because it isn’t in the correct format."))
        }
    }
    
//    MARK: Disable internet before running this test
//    func testNoInternet() async{
//        do{
//            let _ = try await sut!.makeRequest(with: MockRequest.getName, for: Users.self)
//        }catch(let e){
//            XCTAssertEqual(e.localizedDescription, APIError.NoInternetConnection.localizedDescription)
//        }
//    }
    
}
