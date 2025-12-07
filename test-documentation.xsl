<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Unit Test Documentation - RudichChhantel Assignment</title>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body { 
            font-family: 'Courier New', monospace;
            background: #f5f5f5;
            padding: 40px;
            line-height: 1.8;
            color: black;
          }
          .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border: 1px solid black;
            padding: 40px;
          }
          .header {
            border-bottom: 2px solid black;
            padding-bottom: 20px;
            margin-bottom: 40px;
          }
          .header h1 {
            font-size: 1.8em;
            margin-bottom: 5px;
          }
          .header .subtitle {
            font-size: 1em;
          }
          .assembly-info {
            margin-bottom: 30px;
          }
          .assembly-name {
            font-weight: bold;
          }
          .test-section {
            margin-bottom: 40px;
          }
          .section-header {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid black;
          }
          .test-item {
            margin: 20px 0;
            padding-bottom: 15px;
            border-bottom: 1px solid black;
          }
          .test-category {
            font-weight: bold;
            margin-bottom: 5px;
          }
          .test-name {
            font-weight: bold;
            margin: 10px 0;
          }
          .test-summary {
            margin: 10px 0;
            padding-left: 20px;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1>Unit Test Documentation</h1>
            <div class="subtitle">Comprehensive Test Suite for Drawing Application</div>
          </div>
          
          <div class="assembly-info">
            <span class="assembly-name">Assembly: </span>
            <xsl:value-of select="doc/assembly/name"/>
          </div>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">MoveTo Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">DrawTo Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Circle Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Rectangle Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Pen Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Multiline Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Compile Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Factory Tests</xsl:with-param>
          </xsl:call-template>
          
          <xsl:call-template name="test-section">
            <xsl:with-param name="category">Singleton Tests</xsl:with-param>
          </xsl:call-template>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="test-section">
    <xsl:param name="category"/>
    <xsl:variable name="tests" select="doc/members/member[contains(@name, substring-before($category, ' '))]"/>
    
    <xsl:if test="count($tests) &gt; 0">
      <div class="test-section">
        <div class="section-header">
          <xsl:value-of select="$category"/>
        </div>
        <xsl:for-each select="$tests">
          <div class="test-item">
            <div class="test-category">
              <xsl:value-of select="$category"/>
            </div>
            <div class="test-name">
              <xsl:value-of select="substring-after(@name, ':')"/>
            </div>
            <xsl:if test="summary">
              <div class="test-summary">
                <xsl:value-of select="summary"/>
              </div>
            </xsl:if>
          </div>
        </xsl:for-each>
      </div>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
