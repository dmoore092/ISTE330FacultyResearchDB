<?php
?>
<script>
  if("<?php echo $isLoggedIn ?>" == "0") {
      document.getElementById("feedback").style.display = "block";
  }
</script>