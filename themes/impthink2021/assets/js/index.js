var el = document.getElementById("sharebutton");
if(el != null) {
	el.addEventListener("click", async () => {
		try {
			await navigator.share({ title: "{{ $page.title }}", url: "" });
			console.log("Data was shared successfully");
		} catch (err) {
			console.error("Share failed:", err.message);
		}
	});
};
