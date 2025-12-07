<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>API Documentation - RudichChhantel Assignment</title>
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
          .header p {
            font-size: 1em;
          }
          .member {
            margin: 30px 0;
            padding-bottom: 20px;
            border-bottom: 1px solid black;
          }
          .member-type {
            font-weight: bold;
            margin-bottom: 5px;
          }
          .member-name {
            font-weight: bold;
            margin: 10px 0;
            word-wrap: break-word;
          }
          .summary {
            margin: 10px 0;
            padding-left: 20px;
          }
          .section {
            margin: 10px 0;
            padding-left: 20px;
          }
          .section-title {
            font-weight: bold;
            margin-bottom: 5px;
          }
          .param, .exception {
            margin: 5px 0;
            padding-left: 20px;
          }
          .param-name, .exception-type {
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>API Documentation</h1>
          <p>RudichChhantel Assignment - Drawing Application</p>
        </div>
        
        <xsl:apply-templates select="doc/members/member"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="member">
    <div class="member">
      <div class="member-type">
        <xsl:choose>
          <xsl:when test="starts-with(@name, 'T:')">CLASS</xsl:when>
          <xsl:when test="starts-with(@name, 'M:')">METHOD</xsl:when>
          <xsl:when test="starts-with(@name, 'F:')">FIELD</xsl:when>
          <xsl:when test="starts-with(@name, 'P:')">PROPERTY</xsl:when>
        </xsl:choose>
      </div>
      
      <div class="member-name">
        <xsl:value-of select="@name"/>
      </div>
      
      <xsl:if test="summary">
        <div class="summary">
          <xsl:value-of select="summary"/>
        </div>
      </xsl:if>
      
      <xsl:if test="param">
        <div class="section">
          <div class="section-title">Parameters:</div>
          <xsl:for-each select="param">
            <div class="param">
              <span class="param-name"><xsl:value-of select="@name"/></span>
              <xsl:text>: </xsl:text>
              <xsl:value-of select="."/>
            </div>
          </xsl:for-each>
        </div>
      </xsl:if>
      
      <xsl:if test="returns">
        <div class="section">
          <div class="section-title">Returns:</div>
          <xsl:value-of select="returns"/>
        </div>
      </xsl:if>
      
      <xsl:if test="exception">
        <div class="section">
          <div class="section-title">Exceptions:</div>
          <xsl:for-each select="exception">
            <div class="exception">
              <span class="exception-type"><xsl:value-of select="@cref"/></span>
              <xsl:text>: </xsl:text>
              <xsl:value-of select="."/>
            </div>
          </xsl:for-each>
        </div>
      </xsl:if>
      
      <xsl:if test="remarks">
        <div class="section">
          <div class="section-title">Remarks:</div>
          <xsl:value-of select="remarks"/>
        </div>
      </xsl:if>
      
      <xsl:if test="example">
        <div class="section">
          <div class="section-title">Example:</div>
          <xsl:value-of select="example"/>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
