# Table View

Table views in iOS display rows of vertically scrolling content in a single column. Each row in the table contains one piece of your app’s content. For example, the Contacts app displays the name of each contact in a separate row, and the main page of the Settings app displays the available groups of settings. You can configure a table to display a single long list of rows, or you can group related rows into sections to make navigating the content easier.

Tables are common in apps with data that is highly structured or organized hierarchically. Apps that contain hierarchical data often use tables in conjunction with a navigation view controller, which facilitates navigation between different levels of the hierarchy. For example, the Settings app uses tables and a navigation controller to organize the system settings.

### Providing the Data and Cells
- The methods that an object adopts to manage data and provide cells for a table view.
```swift
class ViewController : UITableViewDataSource, ... { ... }
```
- The object that acts as the data source of the table view.
```swift
tableView.dataSource = self
```
### Managing Interactions with the Table.
- Methods for managing selections, configuring section headers and footers, deleting and reordering cells, and performing other actions in a table view.
```swift
class ViewController : UITableViewDelegate, ... { ... }
```
- The object that acts as the delegate of the table view.
```swift
tableView.delegate = self
```
### Override Functions
- Return cell count.
```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return list.count }
```
- Specify cell contents.
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "languagesCell", for: indexPath) as! TableViewCell
    ... 
    return cell
}
```
- Assign the click action to Cell.
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { ... }
```

- Assign swipe action to Cell.
```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if(editingStyle == .delete) {
        ...
    }
}
```
<table class="image-table">
    <tbody>
        <tr>
            <td>
                <img src="https://github.com/omercankoc/table-view/blob/main/images/languages.png" width="350" height="500">
            </td>
            <td>
                <img src="https://github.com/omercankoc/table-view/blob/main/images/search.png" width="350" height="500">
            </td>
            <td>
                <img src="https://github.com/omercankoc/table-view/blob/main/images/language.png" width="350" height="500">
            </td>
        </tr>
    </tbody>
</table>
