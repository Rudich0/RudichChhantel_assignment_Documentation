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
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            line-height: 1.6;
            color: #333;
          }
          .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
          }
          .header {
            background: #2c3e50;
            color: white;
            padding: 30px 40px;
            border-bottom: 4px solid #34495e;
          }
          .header h1 {
            font-size: 2em;
            margin-bottom: 5px;
            font-weight: 600;
          }
          .header p {
            font-size: 1em;
            opacity: 0.9;
          }
          .content {
            padding: 40px;
          }
          .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            border: 1px solid #dee2e6;
          }
          .stat-item {
            text-align: center;
            padding: 15px;
          }
          .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #2c3e50;
          }
          .stat-label {
            color: #666;
            font-size: 0.9em;
            margin-top: 5px;
          }
          .search-box {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 25px;
            border: 2px solid #dee2e6;
            border-radius: 5px;
            font-size: 1em;
            transition: border-color 0.3s ease;
          }
          .search-box:focus {
            outline: none;
            border-color: #2c3e50;
          }
          .member {
            background: white;
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            border-left: 4px solid #2c3e50;
            transition: box-shadow 0.3s ease;
          }
          .member:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
          }
          .member-type {
            display: inline-block;
            background: #2c3e50;
            color: white;
            padding: 4px 12px;
            border-radius: 3px;
            font-size: 0.75em;
            font-weight: 600;
            letter-spacing: 0.5px;
          }
          .member-name {
            color: #2c3e50;
            font-family: 'Courier New', monospace;
            font-size: 0.95em;
            font-weight: 600;
            margin: 12px 0;
            word-wrap: break-word;
          }
          .summary {
            color: #555;
            margin: 12px 0;
            padding: 12px;
            background: #f8f9fa;
            border-radius: 4px;
            border-left: 3px solid #dee2e6;
          }
          .section {
            margin: 12px 0;
            padding: 12px;
            background: #f8f9fa;
            border-radius: 4px;
            border-left: 3px solid #6c757d;
          }
          .section-title {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            font-size: 0.95em;
          }
          .param, .exception {
            margin: 6px 0;
            padding-left: 15px;
            font-size: 0.9em;
          }
          .param-name, .exception-type {
            font-weight: 600;
            color: #495057;
            font-family: 'Courier New', monospace;
          }
        </style>
        <script>
          function searchMembers() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const members = document.getElementsByClassName('member');
            
            for (let i = 0; i &lt; members.length; i++) {
              const text = members[i].textContent.toLowerCase();
              members[i].style.display = text.includes(input) ? 'block' : 'none';
            }
          }
        </script>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1>API Documentation</h1>
            <p>RudichChhantel Assignment - Drawing Application</p>
          </div>
          
          <div class="content">
            <div class="stats">
              <div class="stat-item">
                <div class="stat-number"><xsl:value-of select="count(doc/members/member[starts-with(@name, 'T:')])"/></div>
                <div class="stat-label">Classes</div>
              </div>
              <div class="stat-item">
                <div class="stat-number"><xsl:value-of select="count(doc/members/member[starts-with(@name, 'M:')])"/></div>
                <div class="stat-label">Methods</div>
              </div>
              <div class="stat-item">
                <div class="stat-number"><xsl:value-of select="count(doc/members/member[starts-with(@name, 'F:')])"/></div>
                <div class="stat-label">Fields</div>
              </div>
              <div class="stat-item">
                <div class="stat-number"><xsl:value-of select="count(doc/members/member[starts-with(@name, 'P:')])"/></div>
                <div class="stat-label">Properties</div>
              </div>
            </div>
            
            <input type="text" id="searchInput" class="search-box" placeholder="Search documentation..."/>
            
            <xsl:apply-templates select="doc/members/member"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="member">
    <div class="member">
      <xsl:choose>
        <xsl:when test="starts-with(@name, 'T:')">
          <span class="member-type">CLASS</span>
        </xsl:when>
        <xsl:when test="starts-with(@name, 'M:')">
          <span class="member-type">METHOD</span>
        </xsl:when>
        <xsl:when test="starts-with(@name, 'F:')">
          <span class="member-type">FIELD</span>
        </xsl:when>
        <xsl:when test="starts-with(@name, 'P:')">
          <span class="member-type">PROPERTY</span>
        </xsl:when>
      </xsl:choose>
      
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
          <div class="section-title">Parameters</div>
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
          <div class="section-title">Returns</div>
          <xsl:value-of select="returns"/>
        </div>
      </xsl:if>
      
      <xsl:if test="exception">
        <div class="section">
          <div class="section-title">Exceptions</div>
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
          <div class="section-title">Remarks</div>
          <xsl:value-of select="remarks"/>
        </div>
      </xsl:if>
      
      <xsl:if test="example">
        <div class="section">
          <div class="section-title">Example</div>
          <xsl:value-of select="example"/>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
