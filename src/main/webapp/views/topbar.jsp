<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.modelFirstName}">
        <div class="topbar">
            <div class="topbar-contact">
                <a href="mailto:info@parkflow.com" class="hover-lift"><i class="fas fa-envelope"></i> info@parkflow.com</a>
                <a href="tel:+1234567890" class="hover-lift"><i class="fas fa-phone"></i> +123 456 7890</a>
                <a href="#" class="hover-lift"><i class="fas fa-clock"></i> 24/7 Support</a>
            </div>
            <div class="topbar-auth">
                <div class="user-welcome">
                    <i class="fas fa-user-circle"></i>
                    <span>Welcome, <strong>${modelFirstName}</strong>!</span>
                </div>
                <a href="/parkflow/logout" class="logout hover-lift" name="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="topbar">
            <div class="topbar-contact">
                <a href="mailto:info@parkflow.com" class="hover-lift"><i class="fas fa-envelope"></i> info@parkflow.com</a>
                <a href="tel:+1234567890" class="hover-lift"><i class="fas fa-phone"></i> +123 456 7890</a>
                <a href="#" class="hover-lift"><i class="fas fa-clock"></i> 24/7 Support</a>
            </div>
            <div class="topbar-auth">
                <a href="/parkflow/login" class="login hover-lift" name="login"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="/parkflow/signup" class="signup hover-lift" name="signup"><i class="fas fa-user-plus"></i> Sign Up</a>
            </div>
        </div>
    </c:otherwise>
</c:choose>
