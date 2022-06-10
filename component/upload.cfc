<cfcomponent>
    <cffunction name = "uploadData" returnType = "any"  access = "remote">
        <cfoutput>
            <cfset local.thisDir = expandPath(".")>
            <cffile action="upload" destination="#local.thisDir#/upload" filefield="inputFile" result="upload" nameconflict="makeunique">
            <cfif upload.fileWasSaved>
                <cfset local.savedFile = upload.serverDirectory & "\" & upload.serverFile>
                <cfif isSpreadsheetFile(local.savedFile)>
                    <cfspreadsheet action="read" src="#local.savedFile#" query="content" headerrow="1">
                    <cfset local.finalArray=arrayNew(1)/>
                    <cfloop index = "i" from = "1" to = "#content.recordcount()#"> 
                        <cfset arrayAppend(finalArray,content.1[i])/>
                        <cfdump var=#finalArray[i]#/>
                    </cfloop> 
                   </br></br>
                    <cfset rows=form.inputValue/>
                    <cfset elems    = arrayLen(finalArray)>
                    <cfset columns  = ceiling(elems/rows) />
                    <cfscript>
                        categories = arrayNew(1);
                        for(c=1;c<=elems;c++){
                            ArrayAppend(categories ,c);
                        }  
                    </cfscript>
                    <cfset variables.elems_in_col = ArrayNew(1) /> 
                    <cfset variables.elem_left = elems />
                    <cfloop index="col" from="1" to="#columns#">
                        <cfif columns EQ col >
                            <cfbreak>
                        </cfif>
                        <cfif elem_left mod (columns - col) == 0>
                            <cfset elems_in_col[col] = elem_left / (columns - col) > 
                        <cfelse>
                            <cfset elems_in_col[col] = ceiling(elem_left / (columns - col)) >
                        </cfif>
                        <cfset elem_left = elem_left - elems_in_col[col] >
                        <cfset col= col+1 />
                    </cfloop>
                    <table>
                        <cfloop index="row" from="0" to="#rows#">
                            <tr>
                                <cfset col=1 >
                                <cfloop condition="col LT columns">
                                    <cfif elems_in_col[col] LT row + 1>
                                        <td>&nbsp;</td>
                                        <cfbreak>
                                    </cfif>
                                    <cfset idx = 1 >
                                    <cfset i = col-1 >
                                    <cfloop   condition="i GTE 1">
                                        <cfset idx = idx + elems_in_col[i] >
                                        <cfset i = i-1 >   
                                    </cfloop>
                                    <cfset idx = idx + row >
                                    <td>#categories[idx]#</td>
                                    <cfset col= col+1 />
                                </cfloop> 
                                <cfset row= row+1 />    
                            </tr>
                        </cfloop>
                    </table> 
                </cfif>
            </cfif>
        </cfoutput>
	</cffunction>
</cfcomponent>