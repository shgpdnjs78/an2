<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="template/header.jsp">
        <jsp:param value="인덱스페이지3" name="title"/>
    </jsp:include>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
        #my_camera{
            width: 960px;
            height: 720px;
            border: 1px solid black;
        }
    </style>
    <script type="text/javascript" src="/js/webcam.min.js"></script>
    <script type="text/javascript">
        let isSnapshotTaken = false;

        window.onload=function(){
            Webcam.set({
                width: 640,
                height: 480,
                image_format: 'jpg',
                jpeg_quality: 100
            });
            Webcam.attach( '#my_camera' );


        }

        function take_snapshot() {
            if (!isSnapshotTaken) {
                // take snapshot and get image data
                Webcam.snap(function (data_uri) {
                    // create an image element and set the source to the snapshot
                    var img = document.createElement('img');
                    img.src = data_uri;
                    img.width = 640; // 이미지 가로 크기 설정
                    img.height = 480; // 이미지 세로 크기 설정

                    // append the image to the "results" div to display it
                    document.getElementById('results').appendChild(img);

                    // 이미지를 한 번만 추가하도록 플래그 설정
                    isSnapshotTaken = true;

                });
            }
            // 버튼 요소 가져오기
            var nextButton = document.getElementById("next-button");

            // 버튼 클릭 이벤트 리스너 추가
            nextButton.addEventListener("click", function () {
                // 새로운 URL로 이동
                window.location.href = "http://localhost/r2";

            });
        }
    </script>
</head>
<body>
<main>
    <jsp:include page="body.inc/header.jsp"/>
    <main>
        <div class="container">
            여기는 내용!
            여기에 입력

        </div>

    </main>

    <div id="my_camera" style="width: 640px; height: 480px;"></div>
    <video autoplay="autoplay" style="width: 640px; height: 480px;"></video>
    <div id="results"></div>
    <input type="button" value="Take Snapshot" onclick="take_snapshot()">
    <button id="next-button" class="next-button">다음</button>
</main>
</body>

</html>