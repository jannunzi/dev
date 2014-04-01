<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">


<html>
	<head>
		<title>Movies</title>
	</head>
	<body>
		<h1>Movies</h1>
		<ul>
			<xsl:for-each select="movies/movie">
			<xsl:sort select="title" order="descending"/>
				<xsl:choose>
					<xsl:when test="stars &gt;3">
						<li style="background-color:yellow">
							<xsl:value-of select="title"/>
							<ul>
							<xsl:for-each select="actor">
								<xsl:sort select="lastName"/>
								<li><xsl:value-of select="lastName"/></li>
							</xsl:for-each>
							</ul>
						</li>
					</xsl:when>
					<xsl:when test="stars &gt;1">
						<li style="background-color:blue">
							<xsl:value-of select="title"/>
							<ul>
							<xsl:for-each select="actor">
								<xsl:sort select="lastName"/>
								<li><xsl:value-of select="lastName"/></li>
							</xsl:for-each>
							</ul>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<li style="background-color:red">
							<xsl:value-of select="title"/>
							<ul>
							<xsl:for-each select="actor">
								<xsl:sort select="lastName"/>
								<li><xsl:value-of select="lastName"/></li>
							</xsl:for-each>
							</ul>
						</li>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</ul>
	</body>
</html>


	</xsl:template>
</xsl:stylesheet>