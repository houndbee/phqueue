<html>
<head>
<title>Javascript Populating a Table</title>
<script language="javascript" type="text/javascript">
	var pageSize=3; // number of elements per page
	var startPos=0; // start current page from  element
	var sortOrder=""; // global variable to hold the sort order
	var rowEditing=false; // boolean to stop multiple rows being edited

	// object constructor
	function tableRow(no)
	{
		this.number=no;
	}

	// data Array
	var myRows = new Array();
	myRows[0] = new tableRow(0);
	myRows[1] = new tableRow(1);
	myRows[2] = new tableRow(2);
	myRows[3] = new tableRow(3);
	myRows[4] = new tableRow(4);
	myRows[5] = new tableRow(5);
	myRows[6] = new tableRow(6);
	myRows[7] = new tableRow(7);
	myRows[8] = new tableRow(8);
	myRows[9] = new tableRow(9);

	// function to build the actual table
	function buildTable()
	{
		var outputStr=""; // String to hold output

		outputStr=outputStr + "<table border='2'>";
		outputStr=outputStr + "	<tr>";
		outputStr=outputStr + "		<th><a href='javascript:addRow()'>Add</a></th>";

		// output the header with the link
		if (sortOrder=="")
		{
			outputStr=outputStr + "		<th><a href=\"javascript:sortTable('desc')\">Number</a></th>";
		}
		else
		{
			outputStr=outputStr + "		<th><a href=\"javascript:sortTable('')\">Number</a></th>";
		}

		outputStr=outputStr + "	</tr>";

		// create each Cell
		for (i=startPos;i<(startPos+pageSize);i++)
		{
			// if we have Cells to output
			if (i<myRows.length)
			{
				// assign the value to a temp variable
				var fieldValue=myRows[i].number;

				// handle nulls in the data
				if (fieldValue==null)
				{
					fieldValue='&nbsp;';
				}

				outputStr=outputStr + "	<tr>";
				outputStr=outputStr + " 	<td id='but" + i + "'><input type='button' value='Edit' onclick='editRow(" + i + ")'></td>";
				outputStr=outputStr + "		<td><div id='cell" + i + "'>" + fieldValue + "</div></td>";
				outputStr=outputStr + "	</tr>";
			}
		}

		outputStr=outputStr + "	<tr>";
		outputStr=outputStr + "		<td>&nbsp;</td>";
		outputStr=outputStr + "		<td>";

		// add in the Paging links
		if (startPos>0)
		{
			outputStr=outputStr + "		<a href='javascript:back();'>&lt;-</a>";
		}
		if ((startPos+pageSize)<myRows.length)
		{
			outputStr=outputStr + "		<a href='javascript:forward();'>-&gt;</a>";
		}


		outputStr=outputStr + "		</td>";
		outputStr=outputStr + "	</tr>";
		outputStr=outputStr + "</table>";

		document.getElementById("numberDiv").innerHTML=outputStr;
	}

	function sortTable(param1)
	{
		var swapit=false; // do we need to do a swap ?
		var tempVar; // variable to store the value if we do the sorting
		sortOrder=param1; // assign the parameter to the global variable

		// Bubble sort Ascending to start with
		for (i=0;i<myRows.length;i++)
		{
			if ((i+1)<myRows.length)
			{
				for (j=(i+1);j<myRows.length;j++)
				{
					swapit=false; // reset the swap flag

					if (myRows[i].number > myRows[j].number)
					{
						swapit=true;
					}

					// if we need to do the swap
					if (swapit)
					{
						// swap values over
						tempVar=myRows[i].number;
						myRows[i].number=myRows[j].number;
						myRows[j].number=tempVar;
					}
				}
			}
		}

		// if sorting descending then reverse the array
		if (sortOrder=='desc')
		{
			myRows.reverse();
		}

		// reset the start position
		startPos=0;

		// output the table
		buildTable();
	}

	// back one page
	function back()
	{
		// take one page worth of the index
		startPos=startPos-pageSize;

		// if less than 0 convert to 0
		if (startPos<0)
		{
			startPos=0;
		}

		// rebuild the table
		buildTable();
	}

	// forward one page
	function forward()
	{
		// take one page worth of the index
		startPos=startPos+pageSize;

		// rebuild the table
		buildTable();
	}

	// function to edit rows
	function editRow(rowNo)
	{
		// if a row is currently being edited
		if (rowEditing)
		{
			// cancel that change and then edit the new row
			cancelChange();
			editRow(rowNo);
		}

		// otherwise
		else
		{
			// set the flag
			rowEditing=true;

			// get a reference to the Cell selected
			var theCell=document.getElementById('cell' + rowNo);
			var buttonCell=document.getElementById('but' + rowNo);

			// assign the value to a temp variable
			var fieldValue=myRows[rowNo].number;

			// handle nulls in the data
			if (fieldValue==null)
			{
				fieldValue='';
			}

			// create the new Cell contents
			var cellContent="<input type='text' id='editCell' size='5' value='" + fieldValue + "'>";
			var butContent="<input type='button' value='Save' onclick='saveChange(" + rowNo + ")'>&nbsp;&nbsp;<input type='button' value='Cancel' onclick='cancelChange()'>&nbsp;&nbsp;<input type='button' value='Delete' onclick='delRow(" + rowNo + ")'>";

			// populate the Cells
			theCell.innerHTML=cellContent;
			buttonCell.innerHTML=butContent;
		}
	}

	// function to save the changes
	function saveChange(rowNo)
	{
		// set the flag
		rowEditing=false;

		// get the updated value
		var newValue=document.getElementById('editCell');

		// update the Array
		myRows[rowNo].number=newValue.value;

		// rebuild the table in the correct order
		sortTable(sortOrder);
	}

	// function to Cancel the changes
	function cancelChange()
	{
		// set the flag
		rowEditing=false;

		// rebuild the table in the correct order
		sortTable(sortOrder);
	}

	// function to delete selected row
	function delRow(rowNo)
	{
		// shuffle the rows down
		for (i=rowNo+1;i<myRows.length;i++)
		{
			myRows[i-1].number=myRows[i].number;
		}

		// drop the last element
		myRows.length=myRows.length-1;

		// set the flag
		rowEditing=false;

		// rebuild the table in the correct order
		sortTable(sortOrder);
	}

	// this function adds a row to our datagrid
	function addRow()
	{
		// add an empty placeholder
		myRows[myRows.length]= new tableRow(null);

		// display the last page
		startPos=myRows.length-pageSize;

		// build the table
		buildTable();

		// make the new row editable
		editRow(myRows.length-1);
	}
</script>
</head>
<body>
	The following Table is generated at run time by Client Side Javascript :<p>
	<div id="numberDiv">
	</div>
	<script language="javascript" type="text/javascript">
		buildTable();
	</script>
</body>
</html>