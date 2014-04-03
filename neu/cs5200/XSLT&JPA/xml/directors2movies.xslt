<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<html>
	<head>
	</head>
	<body>
		<ol>
		<xsl:for-each select="directorDatabase/director/movie">
			<xsl:choose>
				<xsl:when test="@stars &gt; 3">
					<li style="background-color: green">
						<xsl:value-of select="@name"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="@stars"/>
						Director: 
						<xsl:value-of select="../@firstName"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="../@lastName"/>
					</li>
				</xsl:when>
				<xsl:otherwise>
					<li>
						<xsl:value-of select="@name"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="@stars"/>
						Director: 
						<xsl:value-of select="../@firstName"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="../@lastName"/>
					</li>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</ol>
	</body>
	</html>
	</xsl:template>
</xsl:stylesheet>