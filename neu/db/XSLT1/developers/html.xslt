<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
				<h2>All Applications</h2>
				<table>
					<xsl:apply-templates/>
				</table>
				<xsl:for-each select="developers/developer">
					<xsl:sort select="lastName" order="descending"/>
					<h2>Developer</h2>
					First: <xsl:value-of select="firstName"/><br/>
					Last: <xsl:value-of select="lastName"/>
					<h3>Applications</h3>
					<table>
						<tr><th>Name</th><th>Genre</th></tr>
					<xsl:for-each select="applications/application">
						<xsl:if test="price &lt; 50">
							<tr>
								<td><xsl:value-of select="name"/></td>
								<td><xsl:value-of select="genre"/></td>
								<td>$<xsl:value-of select="price"/></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
					</table>
					<hr/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="applications">
		<xsl:apply-templates select="application"/>
	</xsl:template>

	<xsl:template match="application">
		<tr>
			<td><xsl:value-of select="name"/></td>
			<td><xsl:value-of select="genre"/></td>
			<td>$<xsl:value-of select="price"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>