<cfcomponent>
	<cffunction access="remote" name="applicationNav" output="true">
		<cfset var I = "">

		<cfloop collection="#application#" item="I">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=application&key=#I#', 'viewer')">#I#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="clientNav" output="true">
		<cfset var I = "">

		<cfloop collection="#client#" item="I">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=client&key=#I#', 'viewer')">#I#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="cookieNav" output="true">
		<cfset var I = "">

		<cfloop collection="#cookie#" item="I">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=cookie&key=#I#', 'viewer')">#I#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="debugNav" output="true">
		<cfset var dbg = "">
		<cfset var I = 0>
		<cfset var msg = "">

		<cfif isDefined('arguments.submittal') and (arguments.submittal is 'erase')>
			<cfset application.Clouseau.debug = arrayNew(1)>
		</cfif>

		<cfform method="post">
			<input name="submittal" style="float: left; margin: 2px;" type="submit" value="erase">
		</cfform>
		<cfform method="post">
			<input name="submittal" style="float: left; margin: 2px;" type="submit" value="refresh">
		</cfform>
		<br style="clear: both;">
		<cfloop array="#application.Clouseau.debug#" index="dbg">
			<cfset msg = ++I>
			<cfif arrayLen(structFindKey(dbg, 'message', "one"))>
				<cfset msg &= structFind(dbg, 'message')>
			</cfif>
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=application.Clouseau.debug&key=#I#', 'viewer')">#msg#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="errorNav" output="true">
		<cfset var err = "">
		<cfset var I = 0>
		<cfset var msg = "">

		<cfif isDefined('arguments.submittal') and (arguments.submittal is 'erase')>
			<cfset application.Clouseau.error = arrayNew(1)>
		</cfif>

		<cfform method="post">
			<input name="submittal" style="float: left; margin: 2px;" type="submit" value="erase">
		</cfform>
		<cfform method="post">
			<input name="submittal" style="float: left; margin: 2px;" type="submit" value="refresh">
		</cfform>
		<br style="clear: both;">
		<cfloop array="#application.Clouseau.error#" index="err">
			<cfset msg = ++I>
			<cfif arrayLen(structFindKey(err, 'message', "one"))>
				<cfset msg &= structFind(err, 'message')>
			</cfif>
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=application.Clouseau.error&key=#I#', 'viewer')">#msg#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="logNav" output="true">
		<cfparam name="application.Clouseau.LogPath" default="c:/coldfusion10/cfusion/logs">

		<cfdirectory action="list" directory="#application.Clouseau.LogPath#" name="logFiles">

		<cfloop query="logFiles">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?log=#name#', 'viewer')">#name#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="serverNav" output="true">
		<cfset var I = "">

		<cfloop collection="#server#" item="I">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=server&key=#I#', 'viewer')">#I#</a>
			<br>
		</cfloop>
	</cffunction>

	<cffunction access="remote" name="sessionNav" output="true">
		<cfset var I = "">

		<cfloop collection="#session#" item="I">
			<a href="##" onclick="ColdFusion.navigate('view.cfm?scope=session&key=#I#', 'viewer')">#I#</a>
			<br>
		</cfloop>
	</cffunction>
</cfcomponent>
