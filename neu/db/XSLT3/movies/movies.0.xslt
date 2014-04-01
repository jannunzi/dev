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
				<li>
					<xsl:value-of select="title"/>
					<ul>
					<xsl:for-each select="actors/actor">
						<li><xsl:value-of select="firstName"/></li>
					</xsl:for-each>
					</ul>
				</li>
			</xsl:for-each>
		</ul>
	</body>
</html>


	</xsl:template>
</xsl:stylesheet>