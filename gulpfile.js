/* eslint-env node */
const gulp = require("gulp"),
	del = require("del"),
	fs = require("fs"),
	{ promisify } = require("util"),
	luabundle = require("luabundle");

const src_dir = "./src",
	build_dir = "./build";

async function build() {
	var bundleContent = luabundle.bundle(`${src_dir}/main.lua`, {
		paths: [
			`${src_dir}/?.lua`,
		]
	});
	await promisify(fs.writeFile)(`${build_dir}/bundle.lua`, bundleContent);
}

function clean() {
	return del(`${build_dir}/**/*`);
}

async function watch() {
	await clean();
	await build();

	gulp.watch(src_dir, build);
}

module.exports = { build, watch, clean };
