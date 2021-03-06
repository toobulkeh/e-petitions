namespace :epets do
  namespace :migrations do
    desc "Migrate countries to location codes"
    task :country_to_location_codes => :environment do
      country_map = {
        "Afghanistan" => "AF",
        "Albania" => "AL",
        "Algeria" => "DZ",
        "American Samoa" => "AS",
        "Andorra" => "AD",
        "Angola" => "AO",
        "Anguilla (British Overseas Territory)" => "AI",
        "Antigua and Barbuda" => "AG",
        "Argentina" => "AR",
        "Armenia" => "AM",
        "Aruba/Dutch Caribbean" => "AW",
        "Ascension Island (British Overseas Territory)" => "SH",
        "Australia" => "AU",
        "Austria" => "AT",
        "Azerbaijan" => "AZ",
        "Bahamas" => "BS",
        "Bahrain" => "BH",
        "Bangladesh" => "BD",
        "Barbados" => "BB",
        "Belarus" => "BY",
        "Belgium" => "BE",
        "Belize" => "BZ",
        "Benin" => "BJ",
        "Bermuda (British Overseas Territory)" => "BM",
        "Bhutan" => "BT",
        "Bolivia" => "BO",
        "Bosnia and Herzegovina" => "BA",
        "Botswana" => "BW",
        "Brazil" => "BR",
        "British Antarctic Territory" => "BAT",
        "British Indian Ocean Territory" => "IO",
        "British Virgin Islands (British Overseas Territory)" => "VG",
        "Brunei" => "BN",
        "Bulgaria" => "BG",
        "Burkina Faso" => "BF",
        "Burma" => "MM",
        "Burundi" => "BI",
        "Cambodia" => "KH",
        "Cameroon" => "CM",
        "Canada" => "CA",
        "Cape Verde" => "CV",
        "Cayman Islands" => "KY",
        "Central African Republic" => "CF",
        "Chad" => "TD",
        "Channel Islands" => "XC",
        "Chile" => "CL",
        "China" => "CN",
        "Colombia" => "CO",
        "Comoros" => "KM",
        "Congo" => "CG",
        "Congo (Democratic Republic)" => "CD",
        "Costa Rica" => "CR",
        "Croatia" => "HR",
        "Cuba" => "CU",
        "Cyprus" => "CY",
        "Czech Republic" => "CZ",
        "Denmark" => "DK",
        "Djibouti" => "DJ",
        "Dominica, Commonwealth of" => "DM",
        "Dominican Republic" => "DO",
        "East Timor (Timor-Leste)" => "TL",
        "Ecuador" => "EC",
        "Egypt" => "EG",
        "El Salvador" => "SV",
        "Equatorial Guinea" => "GQ",
        "Eritrea" => "ER",
        "Estonia" => "EE",
        "Ethiopia" => "ET",
        "Falkland Islands (British Overseas Territory)" => "FK",
        "Fiji" => "FJ",
        "Finland" => "FI",
        "France" => "FR",
        "French Guiana" => "GF",
        "French Polynesia" => "PF",
        "Gabon" => "GA",
        "Gambia" => "GM",
        "Georgia" => "GE",
        "Germany" => "DE",
        "Ghana" => "GH",
        "Gibraltar" => "GI",
        "Greece" => "GR",
        "Grenada" => "GD",
        "Guadeloupe" => "GP",
        "Guatemala" => "GT",
        "Guinea" => "GN",
        "Guinea-Bissau" => "GW",
        "Guyana" => "GY",
        "Haiti" => "HT",
        "Honduras" => "HN",
        "Hong Kong" => "HK",
        "Hungary" => "HU",
        "Iceland" => "IS",
        "India" => "IN",
        "Indonesia" => "ID",
        "Iran" => "IR",
        "Iraq" => "IQ",
        "Ireland" => "IE",
        "Isle of Man" => "IM",
        "Israel" => "IL",
        "Italy" => "IT",
        "Ivory Coast (Cote d'Ivoire)" => "CI",
        "Jamaica" => "JM",
        "Japan" => "JP",
        "Jordan" => "JO",
        "Kazakhstan" => "KZ",
        "Kenya" => "KE",
        "Kiribati" => "KI",
        "North Korea" => "KP",
        "South Korea" => "KR",
        "Kosovo" => "XK",
        "Kuwait" => "KW",
        "Kyrgyzstan" => "KG",
        "Laos" => "LA",
        "Latvia" => "LV",
        "Lebanon" => "LB",
        "Lesotho" => "LS",
        "Liberia" => "LR",
        "Libya" => "LY",
        "Liechtenstein" => "LI",
        "Lithuania" => "LT",
        "Luxembourg" => "LU",
        "Macao" => "MO",
        "Macedonia" => "MK",
        "Madagascar" => "MG",
        "Malawi" => "MW",
        "Malaysia" => "MY",
        "Maldives" => "MV",
        "Mali" => "ML",
        "Malta" => "MT",
        "Marshall Islands" => "MH",
        "Martinique" => "MQ",
        "Mauritania" => "MR",
        "Mauritius" => "MU",
        "Mayotte" => "YT",
        "Mexico" => "MX",
        "Micronesia" => "FM",
        "Moldova" => "MD",
        "Monaco" => "MC",
        "Mongolia" => "MN",
        "Montenegro" => "ME",
        "Montserrat (British Overseas Territory)" => "MS",
        "Morocco" => "MA",
        "Mozambique" => "MZ",
        "Namibia" => "NA",
        "Nauru" => "NR",
        "Nepal" => "NP",
        "Netherlands" => "NL",
        "New Caledonia" => "NC",
        "New Zealand" => "NZ",
        "Nicaragua" => "NI",
        "Niger" => "NE",
        "Nigeria" => "NG",
        "Norway" => "NO",
        "Oman" => "OM",
        "Pakistan" => "PK",
        "Palau" => "PW",
        "The Occupied Palestinian Territories" => "PS",
        "Panama" => "PA",
        "Papua New Guinea" => "PG",
        "Paraguay" => "PY",
        "Peru" => "PE",
        "Philippines" => "PH",
        "Pitcairn" => "PN",
        "Poland" => "PL",
        "Portugal" => "PT",
        "Qatar" => "QA",
        "Réunion" => "RE",
        "Romania" => "RO",
        "Russian Federation" => "RU",
        "Rwanda" => "RW",
        "St Helena" => "SH",
        "St Kitts and Nevis" => "KN",
        "St Lucia" => "LC",
        "St Pierre & Miquelon" => "PM",
        "St Vincent and the Grenadines" => "VC",
        "Samoa" => "WS",
        "São Tomé and Principe" => "ST",
        "Saudi Arabia" => "SA",
        "Senegal" => "SN",
        "Serbia" => "RS",
        "Seychelles" => "SC",
        "Sierra Leone" => "SL",
        "Singapore" => "SG",
        "Slovakia" => "SK",
        "Slovenia" => "SI",
        "Solomon Islands" => "SB",
        "Somalia" => "SO",
        "South Africa" => "ZA",
        "South Georgia & South Sandwich Islands" => "GS",
        "Spain" => "ES",
        "Sri Lanka" => "LK",
        "Sudan" => "SD",
        "Suriname" => "SR",
        "Swaziland" => "SZ",
        "Sweden" => "SE",
        "Switzerland" => "CH",
        "Syria" => "SY",
        "Taiwan" => "TW",
        "Tajikistan" => "TJ",
        "Tanzania" => "TZ",
        "Thailand" => "TH",
        "Togo" => "TG",
        "Tonga" => "TO",
        "Trinidad and Tobago" => "TT",
        "Tristan da Cunha" => "SH",
        "Tunisia" => "TN",
        "Turkey" => "TR",
        "Turkmenistan" => "TM",
        "Turks & Caicos Islands (British Overseas Territory)" => "TC",
        "Tuvalu" => "TV",
        "Uganda" => "UG",
        "Ukraine" => "UA",
        "United Arab Emirates" => "AE",
        "United Kingdom" => "GB",
        "United States" => "US",
        "Uruguay" => "UY",
        "Uzbekistan" => "UZ",
        "Vanuatu" => "VU",
        "Venezuela" => "VE",
        "Vietnam" => "VN",
        "Wallis & Futuna" => "WF",
        "Western Sahara" => "EH",
        "Yemen" => "YE",
        "Zambia" => "ZM",
        "Zimbabwe" => "ZW"
      }

      Signature.find_each do |signature|
        next if signature.location_code?
        next unless country = signature.country
        next unless location_code = country_map[country]

        signature.location_code = location_code
        signature.save(validate: false)
      end

      Petition.find_each do |petition|
        locations = petition.signatures.validated.distinct.pluck(:location_code).compact

        locations.each do |location|
          journal = CountryPetitionJournal.for(petition, location)

          journal.with_lock do
            signature_count = petition.signatures.validated.where(location_code: location).count
            journal.update(signature_count: signature_count)
          end
        end

        petition.touch
      end
    end
  end
end
