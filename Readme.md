<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxDropDownEdit - How to emulate the IncrementalFilteringDelay feature of the ASPxComboBox
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2067/)**
<!-- run online end -->


<p>The ASPxDropDownControl with the ASPxGridView in its DropDownWindowTemplate is the best solution if it is required to display a large number of data.<br />
Unfortunately, this control has no standard incremental filtering delay feature. This example illustrates how to emulate this feature using the client-side code.<br />
The current delay is set by the global JS variable filterTimeout and is equal to 2 sec. You can change it according to your requirements.</p>

<br/>


