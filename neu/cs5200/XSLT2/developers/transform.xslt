<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Developers</h1>
				<ul>
				<xsl:for-each select="developers/developer">
					<xsl:sort select="salary"/>
					<xsl:choose>
						<xsl:when test="salary &gt; 200000">
							<li style="background-color:red">
								<xsl:value-of select="firstName"/>, <xsl:value-of select="lastName"/>, $<xsl:value-of select="salary"/>
							</li>
						</xsl:when>
						<xsl:when test="salary &lt; 150000">
							<li style="background-color:yellow">
								<xsl:value-of select="firstName"/>, <xsl:value-of select="lastName"/>, $<xsl:value-of select="salary"/>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li style="background-color:yellow">
								<xsl:value-of select="firstName"/>, <xsl:value-of select="lastName"/>, $<xsl:value-of select="salary"/>
							</li>
						</xsl:otherwise>
					</xsl:choose>
					<table>
						<tr>
							<th>Name</th>
							<th>Price</th>
						</tr>
					<xsl:for-each select="applications/application">
						<tr>
							<td><xsl:value-of select="name"/></td>
							<td><xsl:value-of select="price"/></td>
						</tr>
					</xsl:for-each>
					</table>
				</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>