<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<div class="container mt-2">
        <form class="d-flex justify-content-center mx-auto">
            <fieldset class="border p-2">
                <h3>Change Password</h3>
                <div class="row mb-3">
                    <div class="col">
                        <label for="exampleInputUsername" class="form-label">Username?</label>
                    <input type="text" class="form-control" id="exampleInputName">
                    </div>
                    <div class="col">
                        <label for="exampleCurrentPass" class="form-label">Current Password?</label>
                    <input type="password" class="form-control" id="exampleCurrentPass">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label for="exampleInputNewPass" class="form-label">New Password?</label>
                    <input type="password" class="form-control" id="exampleInputNewPass">
                    </div>
                    <div class="col">
                        <label for="exampleConfirmPass" class="form-label">Confirm New Password?</label>
                    <input type="password" class="form-control" id="exampleConfirmPass">
                    </div>
                </div>
                <button type="submit" class="btn btn-danger float-end">Change</button>
            </fieldset>
        </form>
    </div>
</body>
</html>