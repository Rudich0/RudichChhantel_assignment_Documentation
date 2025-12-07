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
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            line-height: 1.6;
            color: #333;
          }
          .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
          }
          .header {
            background: #2c3e50;
            color: white;
            padding: 35px 40px;
            border-bottom: 4px solid #34495e;
          }
          .header h1 {
            font-size: 2.2em;
            margin-bottom: 5px;
            font-weight: 600;
          }
          .header .subtitle {
            font-size: 1.1em;
            opacity: 0.9;
          }
          .assembly-info {
            background: #f8f9fa;
            padding: 15px 40px;
            border-bottom: 1px solid #dee2e6;
          }
          .assembly-name {
            font-family: 'Courier New', monospace;
            font-size: 1em;
            color: #495057;
            font-weight: 600;
          }
          .content {
            padding: 40px;
          }
          .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
          }
          .stat-card {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            transition: box-shadow 0.3s ease;
          }
          .stat-card:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
          }
          .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
          }
          .stat-label {
            font-size: 0.9em;
            color: #666;
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
          .test-section {
            margin-bottom: 25px;
          }
          .section-header {
            background: #34495e;
            color: white;
            padding: 12px 20px;
            border-radius: 5px 5px 0 0;
            font-size: 1.1em;
            font-weight: 600;
          }
          .test-list {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            border-top: none;
            border-radius: 0 0 5px 5px;
            padding: 10px;
          }
          .test-item {
            background: white;
            margin: 8px 0;
            padding: 15px;
            border-radius: 4px;
            border-left: 4px solid #6c757d;
            transition: all 0.3s ease;
          }
          .test-item:hover {
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            border-left-color: #2c3e50;
          }
          .test-category {
            display: inline-block;
            background: #6c757d;
            color: white;
            padding: 3px 10px;
            border-radius: 3px;
            font-size: 0.75em;
            font-weight: 600;
            letter-spacing: 0.5px;
          }
          .test-name {
            color: #2c3e50;
            font-family: 'Courier New', monospace;
            font-size: 0.95em;
            font-weight: 600;
            margin: 10px 0;
          }
          .test-summary {
            color: #555;
            margin: 8px 0;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 4px;
            border-left: 3px solid #dee2e6;
            font-size: 0.9em;
          }
          .legend {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 25px;
            border: 1px solid #dee2e6;
          }
          .legend-title {
            font-weight: 600;
            margin-bottom: 12px;
            font-size: 1.1em;
            color: #2c3e50;
          }
          .legend-items {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 10px;
          }
          .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.9em;
          }
          .legend-badge {
            padding: 3px 10px;
            border-radius: 3px;
            font-size: 0.85em;
            font-weight: 600;
            background: #6c757d;
            color: white;
          }
        </style>
        <script>
          function searchTests() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const tests = document.getElementsByClassName('test-item');
            
            for (let i = 0; i &lt; tests.length; i++) {
              const text = tests[i].textContent.toLowerCase();
              tests[i].style.display = text.includes(input) ? 'block' : 'none';
            }
          }
        </script>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1>Unit Test Documentation</h1>
            <div class="subtitle">Comprehensive Test Suite for Drawing Application</div>
          </div>
          
          <div class="assembly-info">
            <div class="assembly-name">
              <xsl:value-of select="doc/assembly/name"/>
            </div>
          </div>
          
          <div class="content">
            <div class="stats">
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Test')])"/>
                </div>
                <div class="stat-label">Total Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'MoveTo')])"/>
                </div>
                <div class="stat-label">MoveTo Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'DrawTo')])"/>
                </div>
                <div class="stat-label">DrawTo Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Circle')])"/>
                </div>
                <div class="stat-label">Circle Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Rectangle')])"/>
                </div>
                <div class="stat-label">Rectangle Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Factory')])"/>
                </div>
                <div class="stat-label">Factory Tests</div>
              </div>
            </div>
            
            <div class="legend">
              <div class="legend-title">Test Categories</div>
              <div class="legend-items">
                <div class="legend-item">
                  <span class="legend-badge">MoveTo</span>
                  <span>Position tracking tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">DrawTo</span>
                  <span>Line drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Circle</span>
                  <span>Circle drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Rectangle</span>
                  <span>Rectangle drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Pen</span>
                  <span>Color setting tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Multiline</span>
                  <span>Program execution tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Compile</span>
                  <span>Parameter validation tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Factory</span>
                  <span>Command creation tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge">Singleton</span>
                  <span>Pattern implementation tests</span>
                </div>
              </div>
            </div>
            
            <input type="text" id="searchInput" class="search-box" placeholder="Search tests by name or description..."/>
            
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
          <xsl:value-of select="$category"/> (<xsl:value-of select="count($tests)"/>)
        </div>
        <div class="test-list">
          <xsl:for-each select="$tests">
            <div class="test-item">
              <span class="test-category">
                <xsl:value-of select="$category"/>
              </span>
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
      </div>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
