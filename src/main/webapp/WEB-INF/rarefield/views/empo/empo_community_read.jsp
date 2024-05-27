<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.HashMap" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<%@ include file="/WEB-INF/rarefield/views/commons/header.jsp" %>

  <!-- Quill 편집기의 스타일 지정 -->
  <style>
    #editor {
        height: 35rem;
        overflow: auto;
    }
  
  </style>



<sec:authentication property="principal" var="userDetailsBean" />
<main class="row justify-content-between">
    
    <%@ include file="/WEB-INF/rarefield/views/commons/side_left_banner.jsp" %>

    <div class="col-8 row">
        <div class="container">
            <form action="">
                <% HashMap result=(HashMap) request.getAttribute("result"); %>
                
                <p style="font-size: small;">
                </p>
                <br>
        
                <div>
                    <h3><%= result.get("community_title") %></h3>
                    <div><%= result.get("community_choice") %></div>
                    <div style="font-size: small;" class="text-end"><%= result.get("user_ID") %> | <%= result.get("community_date") %></div>
                </div>
        
                <hr>
        
                <div>
                    <div id="editor"></div>
                </div>

                <div>
                    <input type="hidden" class="form-check-input" name="deleteIds" value='<%= result.get("community_ID") %>'>
                    <input type="hidden" class="form-check-input" name="community_ID" value='<%= result.get("community_ID") %>'>
                    <button type="submit" class="btn btn-primary" formaction="/empo_community/selectSearch" formmethod="get">List</button>
                    <sec:authorize access="isAuthenticated()">
                        <c:if test="${userDetailsBean.username.equals(result.get('user_ID'))}">
                            <button type="submit" class="btn btn-success" formaction="/empo_community/update" formmethod="get">UPDATE</button>
                            <button type="submit" class="btn btn-danger" name="btn_type" formaction="/empo_community/list_pagination" formmethod="post">DELETE</button>
                        </c:if>
                    </sec:authorize> 
                    
                    
                    
                </div>
                    <br>
                <div style="font-size: small;">찜 | 댓글수</div>
        
                <hr>
        
                <!-- 댓글기능 -->
        
            </form>
        </div>
    </div>

    <%@ include file="/WEB-INF/rarefield/views/commons/side_right_banner.jsp" %>

      
    </main>
    <hr>
    <%@ include file="/WEB-INF/rarefield/views/commons/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.0-beta.0/dist/quill.js"></script>
    <script>
        // 서버나 다른 소스에서 로드한 콘텐츠를 대표하는 가상의 데이터
        let contentFromServer = '<%= result.get("community_content") %>';
    
        // Quill 편집기 초기화
        let quill = new Quill('#editor', {
            theme: 'snow',
            readOnly: true, // 읽기 전용으로 설정
            modules: {
                toolbar: false // 툴바 비활성화
            }        
        });
    
        // 서버에서 가져온 콘텐츠로 편집기를 채움
        quill.root.innerHTML = contentFromServer;
    </script>
    

    </html>