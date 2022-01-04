document.getElementById("sharebutton").addEventListener("click", async () => {
	try {
		await navigator.share({ title: "{{ $page.title }}", url: "" });
		console.log("Data was shared successfully");
	} catch (err) {
		console.error("Share failed:", err.message);
	}
});
