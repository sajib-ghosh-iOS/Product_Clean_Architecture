## Description

This is an iOS application which fetches product list from a public api and shows them in a list. By clicking on each item in the list it goes to the product details page.
This project is built using Clean architecture with MVVM. SwiftUI has been used for UI.

## Screenshots

![ProductList](https://github.com/sajib-ghoshInnofied/Product_Clean_Architecture/assets/15829311/cad6d8f7-ca0f-40bf-9078-32a87fd4559e)

![ProductDetails](https://github.com/sajib-ghoshInnofied/Product_Clean_Architecture/assets/15829311/be8ba947-d17e-4f10-83c6-876593be0b07)

## Test Coverage

### Unit Tests
More than 85% test cases have been covered.

<img width="823" alt="TestCoverage" src="https://github.com/sajib-ghoshInnofied/Product_Clean_Architecture/assets/15829311/0a281c59-4b7d-49de-a8f1-59ca00894c53">

### Snapshot Tests
All the views have been covered in snapshot tests.

I have included snapshot tests for **iPhone SE (3rd Gen) 16.0 and 17.2** simulator/device. If this device (iPhone SE 3rd Gen) with any of the mentioned iOS versions (16.0 or 17.2) is available, please run the test, it should succeed.

Otherwise, if the above mentioned device with mentioned version is not available, please follow the below steps to run the Snapshot tests.
1. Go to the class **SpashotTestWrapper** and **uncomment** the line ```recordMode = true```
2. Run the test - CMD + U
3. After running for the first you should get errors in the Snanpshots test cases, please check the errors
4. Go to the class **SpashotTestWrapper** and **comment** the line ```recordMode = true```
5. Run the test again, now all the snapshot tests should run succesfully.
