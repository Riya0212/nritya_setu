///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Hello'
	String get hello => 'Hello';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'App Language'
	String get appLanguage => 'App Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'SKIP >>'
	String get skip => 'SKIP >>';

	/// en: 'NEXT'
	String get next => 'NEXT';

	/// en: 'USE NOW'
	String get useNow => 'USE NOW';

	/// en: 'This field is required'
	String get requiredField => 'This field is required';

	/// en: 'Product Name'
	String get productName => 'Product Name';

	/// en: 'Product Brand'
	String get productBrand => 'Product Brand';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Quantity'
	String get quantity => 'Quantity';

	/// en: 'Price/unit'
	String get price_unit => 'Price/unit';

	/// en: 'Retailer Name'
	String get retailerName => 'Retailer Name';

	/// en: 'Select Retailer Name'
	String get retailerHint => 'Select Retailer Name';

	/// en: 'Enter Product Name'
	String get productNameHint => 'Enter Product Name';

	/// en: 'Enter Product Brand'
	String get productBrandHint => 'Enter Product Brand';

	/// en: 'Enter Quantity'
	String get quantityHint => 'Enter Quantity';

	/// en: 'Select Category'
	String get categoryHint => 'Select Category';

	/// en: 'unit'
	String get unit => 'unit';

	/// en: 'Enter Price'
	String get priceHint => 'Enter Price';

	/// en: 'RESET'
	String get reset => 'RESET';

	/// en: 'SUBMIT'
	String get submit => 'SUBMIT';

	/// en: 'Add Products'
	String get addProducts => 'Add Products';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'hello' => 'Hello',
			'login' => 'Login',
			'appLanguage' => 'App Language',
			'english' => 'English',
			'arabic' => 'Arabic',
			'skip' => 'SKIP >>',
			'next' => 'NEXT',
			'useNow' => 'USE NOW',
			'requiredField' => 'This field is required',
			'productName' => 'Product Name',
			'productBrand' => 'Product Brand',
			'category' => 'Category',
			'quantity' => 'Quantity',
			'price_unit' => 'Price/unit',
			'retailerName' => 'Retailer Name',
			'retailerHint' => 'Select Retailer Name',
			'productNameHint' => 'Enter Product Name',
			'productBrandHint' => 'Enter Product Brand',
			'quantityHint' => 'Enter Quantity',
			'categoryHint' => 'Select Category',
			'unit' => 'unit',
			'priceHint' => 'Enter Price',
			'reset' => 'RESET',
			'submit' => 'SUBMIT',
			'addProducts' => 'Add Products',
			_ => null,
		};
	}
}
