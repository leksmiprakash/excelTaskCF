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
                   </br>
                    <cfset count=form.inputValue/>
                    <cfset iRows = arrayLen(finalArray)>
                   
                    
                    <table border="1">
                        <cfloop index="i" from="1" to="#count#">
                            <tr>
                                <cfloop index="j" from="#i#" to="#iRows#">
                                    
                                    <cfset inct =j >  
                                    <td>
                                        <cfdump var=#finalArray[inct]#/>
                                    </td>
                                    <cfset inct = inct + 4>
                                </cfloop>
                            </tr>
                        </cfloop>
                    </table>
                </cfif>
            </cfif>
        </cfoutput>
	</cffunction>
</cfcomponent>