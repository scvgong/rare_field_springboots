<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.List, com.yojulab.study_springboot.utils.Paginations" %>
<%@ page import="java.util.Map" %>
<%@ include file="/WEB-INF/rarefield/views/commons/header.jsp" %>
<style>
    table {
        border: 1px solid black;
    }

    .nav-link {
        color: black;
    }


    #pages:active, #pages:hover {
        font-weight: bolder;
    }
</style>


    <main class="row justify-content-between">
        <%@ include file="/WEB-INF/rarefield/views/commons/side_left_banner.jsp" %>
        <div class="col-8 row">
        <form action="" method="get">
        <main class="container">
        <div>
            <h2 class="text-center  fw-bold"> <a href="/trend/news">news</a></h2>
        </div>
        <div style="height: 20px;"></div>

        <div class="row justify-content-center text-center">
            <div class="row col-7 justify-content-center">
                <div class="col-3">
                    <select  style="border-radius: 25px;" class="form-control" name="key_name">
                        <option value=""> 제목 </option>
                        <option value=""> 언론사명 </option>
                    </select>
                </div>
                <div class="col-6">
                    <input  style="border-radius: 0px;" class="form-control" placeholder="Enter Search!" name="search_word"
                        value="{{request._query_params.word}}">
                </div>
                <div class="col-2">

                    <button  style="border: none; background: none;" type="submit" style="border:none; background: none;" formaction="/trend/trend_news"
                        formmethod="get"><svg width="32" height="32" viewBox="0 0 80 80" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <g filter="url(#filter0_d_7_45)">
                                <path
                                    d="M5 40C5 20.67 20.67 5 40 5C59.33 5 75 20.67 75 40C75 59.33 59.33 75 40 75C20.67 75 5 59.33 5 40Z"
                                    fill="#04CBFC" fill-opacity="0.47" shape-rendering="crispEdges" />
                            </g>
                            <path d="M35 50L45 40L35 30" stroke="white" stroke-width="5" stroke-linecap="round" />
                            <defs>
                                <filter id="filter0_d_7_45" x="0" y="0" width="80" height="80"
                                    filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                    <feFlood flood-opacity="0" result="BackgroundImageFix" />
                                    <feColorMatrix in="SourceAlpha" type="matrix"
                                        values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha" />
                                    <feOffset />
                                    <feGaussianBlur stdDeviation="2.5" />
                                    <feComposite in2="hardAlpha" operator="out" />
                                    <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0" />
                                    <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_7_45" />
                                    <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_7_45"
                                        result="shape" />
                                </filter>
                            </defs>
                        </svg></button>
                </div>
            </div>
        </div>
        <br>
        <div style="width: 80%;" class="container">
        <!-- 카테고리별 탭 -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#category1" data-toggle="tab" data-category="전체">전체</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#category2" data-toggle="tab" data-category="의료/법안">의료/법안</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#category3" data-toggle="tab" data-category="신약/개발">신약/개발</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#category4" data-toggle="tab" data-category="심포지엄/행사">심포지엄/행사</a>
            </li>
        </ul>
        <!-- 탭 내용 -->
        <br>
        <% Map<String,Object> result = (Map<String,Object>) request.getAttribute("result"); 
           List<Map<String,Object>> records = (List<Map<String,Object>>) result.get("news");  
            session.setAttribute("newsRecords", records);
           for(int i = 0 ; i < records.size() ; i=i+1) {
            HashMap<String, Object> record = (HashMap<String, Object>) records.get(i); %>

        <div class="tab-content container" style="width: 80%;" onclick="location.href='/trend/read/<%= record.get("_id") %>'" style="cursor: pointer;">
            <h7 class="tab-pane fade show active">
                <a href="/trend/read/<%= record.get("_id") %>" style="color: #4b4b4b;" class=""><%= record.get("news_paper") %>
                </a>
            </h7>
            <div class="tit">
                <h5 class=""><a href="/trend/read/<%= record.get("_id") %>" class="">
                        <%= record.get("news_title") %>
                    </a></h5>
            </div>
            <div class="row justify-content-end">
                <h7 class="category col-2">
                    <a href="/trend/read/<%= record.get("_id") %>" style="color: #4b4b4b;" class=""> <%= record.get("news_datetime") %>
                    </a>
                </h7>
                <h7 class="category col-2">
                    <a href="/trend/read/<%= record.get("_id") %>" style="color: #4b4b4b;" class=""> <%= record.get("news_topic") %>
                    </a>
                </h7>
                <h7 class="category col-2">
                    <a href="/trend/read/<%= record.get("_id") %>" style="color: #4b4b4b;" class="">조회수
                    </a>
                </h7>

            </div>
        </div>
        <hr>

        <% } %>

    </div>
    <%
        Paginations paginations = (Paginations)result.get("pagination"); 
    %>
    <div>총 갯수 : <%= paginations.getTotalCount() %></div>
        <div style="height: 20px;"></div>
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item {{ '' if pagination.has_previous_block else 'disabled' }}">
                    <a  style="border: none; background: none;" class="page-link" href="/trend/news?currentPage=1">
                        <svg width="21" height="18" viewBox="0 0 21 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 3L12 9L18 15" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                            <path d="M10 3L4 9L10 15" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                        </svg>
                    </a>
                </li>
                <li class="page-item {{ '' if pagination.has_previous_page else 'disabled' }}">
                    <a style="border: none; background: none;" class="page-link"
                        href="/trend/news?currentPage=<%= paginations.getPreviousPage() %>"><svg width="13" height="18" viewBox="0 0 13 18" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 3L4 9L10 15" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                    </svg></a>
                </li>
                <%
                    for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                %>
                <li class=" page-item {{ 'active' if page_num == pagination.current_page else '' }}" id="pages">
                    <a style="border: none; background: none; color: black;" class="page-link" href="/trend/news?currentPage=<%= i %>">
                        <%= i %>
                    </a>
                </li>
                <% } %>
                <li class=" page-item {{ '' if pagination.has_next_page else 'disabled' }}">
                    <a style="border: none; background: none;" class="page-link"
                        href="/trend/news?currentPage=<%= paginations.getNextPage() %>"><svg width="13" height="18" viewBox="0 0 13 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M3 15L9 9L3 3" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                        </svg>
                    <path d="M4 0V22" stroke="#EDEDED" stroke-width="7" />
                </svg></a>
                </li>
                <li class=" page-item {{ '' if pagination.has_next_block else ' disabled' }}">
                    <a style="border: none; background: none;" class="page-link" href="/trend/news?currentPage=<%= paginations.getTotalPage() %>">
                        <svg width="21" height="18" viewBox="0 0 21 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M3 15L9 9L3 3" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                            <path d="M11 15L17 9L11 3" stroke="#696969" stroke-width="5" stroke-linecap="round" />
                        </svg>
                    </a>
                </li>
            </ul>
        </nav>
        <div style="height: 20px;"></div>
    </main>
    </form>
    </div>
        <%@ include file="/WEB-INF/rarefield/views/commons/side_right_banner.jsp" %>

    </main>

<%@ include file="/WEB-INF/rarefield/views/commons/footer.jsp" %>

<!-- jQuery를 불러오는 CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function () {
        // 카테고리별 탭을 클릭했을 때
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // 선택된 탭의 href 속성값을 가져옴
            var target = $(e.target).data('category');

            // 해당 탭의 데이터를 동적으로 로드
            if (target === "#category1") {
                loadCategoryData("전체");
            } else if (target === "#category2") {
                loadCategoryData("의료/법안");
            } else if (target === "#category3") {
                loadCategoryData("신약/개발");
            } else if (target === "#category4") {
                loadCategoryData("심포지엄/행사");
            }
        });
    });

    function loadCategoryData(category) {
        // 서버로 카테고리 정보를 전송하여 해당 카테고리의 데이터를 받아옴
        $.ajax({
            url: '/trend_news',  // 해당 API 엔드포인트로 설정
            method: 'GET',
            data: { category: category },
            success: function (data) {
                // 받아온 데이터를 화면에 출력하는 코드
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
