<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>RudichChhantel Assignment - API Documentation</title>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
            line-height: 1.6;
          }
          .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
          }
          .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
          }
          .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
          }
          .header p {
            font-size: 1.2em;
            opacity: 0.9;
          }
          .content {
            padding: 40px;
          }
          .member {
            background: #f8f9fa;
            margin: 20px 0;
            padding: 25px;
            border-radius: 10px;
            border-left: 5px solid #667eea;
            transition: all 0.3s ease;
          }
          .member:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: translateY(-2px);
          }
          .member-type {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8em;
            margin-bottom: 10px;
          }
          .member-name {
            color: #2c3e50;
            font-family: 'Courier New', monospace;
            font-size: 1.1em;
            font-weight: bold;
            margin: 15px 0;
            word-wrap: break-word;
          }
          .summary {
            color: #555;
            margin: 15px 0;
            padding: 15px;
            background: white;
            border-radius: 5px;
          }
          .section {
            margin: 15px 0;
            padding: 15px;
            background: white;
            border-radius: 5px;
            border-left: 3px solid #3498db;
          }
          .section-title {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 1.1em;
          }
          .param, .exception {
            margin: 8px 0;
            padding-left: 20px;
          }
          .param-name, .exception-type {
            font-weight: bold;
            color: #e74c3c;
            font-family: 'Courier New', monospace;
          }
          .search-box {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 2px solid #667eea;
            border-radius: 10px;
            font-size: 1em;
          }
          .stats {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            margin-bottom: 30px;
          }
          .stat-item {
            text-align: center;
          }
          .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
          }
          .stat-label {
            color: #666;
            font-size: 0.9em;
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
            <h1>📚 API Documentation</h1>
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
            
            <input type="text" id="searchInput" class="search-box" placeholder="🔍 Search documentation..." onkeyup="searchMembers()"/>
            
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
          <div class="section-title">📋 Parameters</div>
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
          <div class="section-title">↩️ Returns</div>
          <xsl:value-of select="returns"/>
        </div>
      </xsl:if>
      
      <xsl:if test="exception">
        <div class="section" style="border-left-color: #e74c3c;">
          <div class="section-title">⚠️ Exceptions</div>
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
          <div class="section-title">💡 Remarks</div>
          <xsl:value-of select="remarks"/>
        </div>
      </xsl:if>
      
      <xsl:if test="example">
        <div class="section">
          <div class="section-title">📝 Example</div>
          <xsl:value-of select="example"/>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
