<%--
  - group_list.jsp
  -
  - Version: $Revision$
  -
  - Date: $Date$
  -
  - Copyright (c) 2001, Hewlett-Packard Company and Massachusetts
  - Institute of Technology.  All rights reserved.
  -
  - Redistribution and use in source and binary forms, with or without
  - modification, are permitted provided that the following conditions are
  - met:
  -
  - - Redistributions of source code must retain the above copyright
  - notice, this list of conditions and the following disclaimer.
  -
  - - Redistributions in binary form must reproduce the above copyright
  - notice, this list of conditions and the following disclaimer in the
  - documentation and/or other materials provided with the distribution.
  -
  - - Neither the name of the Hewlett-Packard Company nor the name of the
  - Massachusetts Institute of Technology nor the names of their
  - contributors may be used to endorse or promote products derived from
  - this software without specific prior written permission.
  -
  - THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  - ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  - LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  - A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  - HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  - INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  - BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
  - OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  - ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
  - TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
  - USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
  - DAMAGE.
  --%>


<%--
  - Display list of Groups, with 'edit' and 'delete' buttons next to them
  -
  - Attributes:
  -
  -   groups - Group [] of groups to work on
  --%>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.eperson.Group" %>

<%
    Group[] groups =
        (Group[]) request.getAttribute("groups");
%>

<dspace:layout title="Group Editor"
               navbar="admin"
               locbar="link"
               parentlink="/admin"
               parenttitle="Administer">

    <h1>Group Editor</h1>

    <table class="miscTable" align="center">
        <tr>
            <th class="oddRowOddCol"><strong>ID</strong></th>
            <th class="oddRowEvenCol"><strong>Name</strong></th>
            <th class="oddRowOddCol">&nbsp;</th>
            <th class="oddRowEvenCol">&nbsp;</th>
        </tr>

<%
    String row = "even";
    for (int i = 0; i < groups.length; i++)
    {
%>
        <form method=POST>
            <tr>
                <td class="<%= row %>RowOddCol"><%= groups[i].getID() %></td>
                <td class="<%= row %>RowEvenCol">
                    <%= groups[i].getName() %>
                </td>
                <td class="<%= row %>RowOddCol">
                    <input type="hidden" name="group_id" value="<%= groups[i].getID() %>">
                    <input type="submit" name="submit_edit" value="Edit">
                </td>
                <td class="<%= row %>RowEvenCol">
                    <input type="submit" name="submit_group_delete" value="Delete...">
                </td>
            </tr>
        </form>
<%
        row = (row.equals("odd") ? "even" : "odd");
    }
%>
    </table>
    
    <p align="center">
        <form method=POST>
            <input type="submit" name="submit_add" value="Add New">
        </form>
    </p>
        
</dspace:layout>
