/* ==========================================================================
   Burke County Recreation Department - site behavior (jQuery)
   ========================================================================== */
(function ($) {
  "use strict";

  $(function () {

    /* ---------- Mobile navigation toggle ---------- */
    var $toggle = $(".nav-toggle");
    var $nav = $("#mainNav");

    $toggle.on("click", function () {
      var open = $nav.toggleClass("is-open").hasClass("is-open");
      $(this).toggleClass("is-open", open).attr("aria-expanded", open);
    });

    // Expand/collapse a dropdown (Sports) via its caret button,
    // closing any other one that is open
    $nav.on("click", ".submenu-toggle", function () {
      var $item = $(this).closest(".has-dropdown");
      $nav.find(".has-dropdown.is-open").not($item).removeClass("is-open")
        .find(".submenu-toggle").attr("aria-expanded", false);
      var open = $item.toggleClass("is-open").hasClass("is-open");
      $(this).attr("aria-expanded", open);
    });

    // Close any open dropdown when clicking elsewhere or pressing Escape
    $(document).on("click", function (e) {
      if (!$(e.target).closest(".has-dropdown").length) {
        $nav.find(".has-dropdown.is-open").removeClass("is-open")
          .find(".submenu-toggle").attr("aria-expanded", false);
      }
    }).on("keydown", function (e) {
      if (e.key === "Escape") {
        $nav.find(".has-dropdown.is-open").removeClass("is-open")
          .find(".submenu-toggle").attr("aria-expanded", false);
      }
    });

    // Close the menu when a link is tapped (mobile)
    $nav.on("click", "a", function () {
      if ($nav.hasClass("is-open")) {
        $nav.removeClass("is-open");
        $toggle.removeClass("is-open").attr("aria-expanded", false);
      }
    });

    // Reset menu state when resizing back to desktop
    $(window).on("resize", function () {
      if ($(window).width() > 820) {
        $nav.removeClass("is-open");
        $toggle.removeClass("is-open").attr("aria-expanded", false);
      }
    });

    /* ---------- Scroll reveal animation ---------- */
    var $reveal = $(".reveal");
    if ("IntersectionObserver" in window && $reveal.length) {
      var io = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add("in");
            io.unobserve(entry.target);
          }
        });
      }, { threshold: 0.12 });
      $reveal.each(function () { io.observe(this); });
    } else {
      $reveal.addClass("in");
    }

    /* ---------- Smooth anchor scrolling ---------- */
    $('a[href^="#"]').on("click", function (e) {
      var target = this.hash;
      if (target && target.length > 1 && $(target).length) {
        e.preventDefault();
        $("html, body").animate({ scrollTop: $(target).offset().top - 90 }, 400);
      }
    });

    /* ---------- Client-side form validation ---------- */
    // Works alongside ASP.NET server validation as a friendly first pass.
    var $form = $("form.js-validate");
    if ($form.length) {
      var emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

      function validateField($field) {
        var $input = $field.find("input, select, textarea").first();
        if (!$input.length) { return true; }
        var val = $.trim($input.val());
        var required = $input.prop("required") || $field.hasClass("required");
        var ok = true;

        if (required && val === "") {
          ok = false;
        } else if (val !== "" && $input.attr("type") === "email" && !emailRe.test(val)) {
          ok = false;
        }
        $field.toggleClass("invalid", !ok);
        return ok;
      }

      $form.on("blur", "input, select, textarea", function () {
        validateField($(this).closest(".field"));
      });

      $form.on("submit", function (e) {
        var allOk = true;
        $form.find(".field").each(function () {
          if (!validateField($(this))) { allOk = false; }
        });
        if (!allOk) {
          e.preventDefault();
          var $first = $form.find(".field.invalid").first();
          if ($first.length) {
            $("html, body").animate({ scrollTop: $first.offset().top - 110 }, 350);
            $first.find("input, select, textarea").first().focus();
          }
        }
      });
    }

  });
})(jQuery);
