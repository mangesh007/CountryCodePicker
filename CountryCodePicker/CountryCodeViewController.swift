//
//  CountryCodeViewController.swift
//  CountryCodePicker
//
//  Created by Mangesh Lad on 13/01/16.
//  Copyright © 2016 CliniFact. All rights reserved.
//

import UIKit

protocol CountryCodePickerViewControllerDelegate : class {
    func countryCodePickerVCDismissed(countryCode : String?)
}

class CountryCodeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let pickerData = ["Afghanistan +93","Albania +355","Algeria +213","Andorra +376","Angola +244","Antigua and Barbuda +1-268","Argentina +54","Armenia +374","Australia +61","Austria +43","Azerbaijan +994","Bahamas +1-242","Bahrain +973","Bangladesh +880","Barbados +1-246","Belarus +375","Belgium +32","Belize +501","Benin +229","Bhutan +975","Bolivia +591","Bosnia and Herzegovina +387","Botswana +267","Brazil +55","Brunei +673","Bulgaria +359","Burkina Faso +226","Burundi +257","Cambodia +855","Cameroon +237","Canada +1","Cape Verde +238","Central African Republic +236","Chad +235","Chile +56","China, People's Republic of +86","Colombia +57","Comoros +269","Congo (Congo ñ Kinshasa) +243","Congo (Congo ñ Brazzaville) +242","Costa Rica +506","Cote d'Ivoire (Ivory Coast) +225","Croatia +385","Cuba +53","Cyprus +357","Czech Republic +420","Denmark +45","Djibouti +253","Dominica +1-767","Dominican Republic +1-809 and 1-829","Ecuador +593","Egypt +20","El Salvador +503","Equatorial Guinea +240","Eritrea +291","Estonia +372","Ethiopia +251","Fiji +679","Finland +358","France +33","Gabon +241","Gambia +220","Georgia +995","Germany +49","Ghana +233","Greece +30","Grenada +1-473","Guatemala +502","Guinea +224","Guinea-Bissau +245","Guyana +592","Haiti +509","Honduras +504","Hungary +36","Iceland +354","India +91","Indonesia +62","Iran +98","Iraq +964","Ireland +353","Israel +972","Italy +39","Jamaica +1-876","Japan +81","Jordan +962","Kazakhstan +7","Kenya +254","Kiribati +686","Korea (North Korea) +850","Korea (South Korea) +82","Kuwait +965","Kyrgyzstan +996","Laos +856","Latvia +371","Lebanon +961","Lesotho +266","Liberia +231","Libya +218","Liechtenstein +423","Lithuania +370","Luxembourg +352","Macedonia +389","Madagascar +261","Malawi +265","Malaysia +60","Maldives +960","Mali +223","Malta +356","Marshall Islands +692","Mauritania +222","Mauritius +230","Mexico +52","Micronesia +691","Moldova +373","Monaco +377","Mongolia +976","Montenegro +382","Morocco +212","Mozambique +258","Myanmar (Burma) +95","Namibia +264","Nauru +674","Nepal +977","Netherlands +31","New Zealand +64","Nicaragua +505","Niger +227","Nigeria +234","Norway +47","Oman +968","Pakistan +92","Palau +680","Panama +507","Papua New Guinea +675","Paraguay +595","Peru +51","Philippines +63","Poland +48","Portugal +351","Qatar +974","Romania +40","Russia +7","Rwanda +250","Saint Kitts and Nevis +1-869","Saint Lucia +1-758","Saint Vincent and the Grenadines +1-784","Samoa +685","San Marino +378","Sao Tome and Principe +239","Saudi Arabia +966","Senegal +221","Serbia +381","Seychelles +248","Sierra Leone +232","Singapore +65","Slovakia +421","Slovenia +386","Solomon Islands +677","Somalia +252","South Africa +27","Spain +34","Sri Lanka +94","Sudan +249","Suriname +597","Swaziland +268","Sweden +46","Switzerland +41","Syria +963","Tajikistan +992","Tanzania +255","Thailand +66","Timor-Leste (East Timor) +670","Togo +228","Tonga +676","Trinidad and Tobago +1-868","Tunisia +216","Turkey +90","Turkmenistan +993","Tuvalu +688","Uganda +256","Ukraine +380","United Arab Emirates +971","United Kingdom +44","United States +1","Uruguay +598","Uzbekistan +998","Vanuatu +678","Vatican City +379","Venezuela +58","Vietnam +84","Yemen +967","Zambia +260","Zimbabwe +263","Abkhazia +995","China (Taiwan) +886","Nagorno-Karabakh +374-97","Northern Cyprus +90-392","Pridnestrovie (Transnistria) +373-533","Somaliland +252","South Ossetia +995","Christmas Island +61","Cocos (Keeling) Islands +61","Norfolk Island +672","New Caledonia +687","French Polynesia +689","Mayotte +262","Saint Barthelemy +590","Saint Martin +590","Saint Pierre and Miquelon +508","Wallis and Futuna +681","Cook Islands +682","Niue +683","Tokelau +690","Guernsey +44","Isle of Man +44","Jersey +44","Anguilla +1-264","Bermuda +1-441","British Indian Ocean Territory +246","British Sovereign Base Areas +357","British Virgin Islands +1-284","Cayman Islands +1-345","Falkland Islands (Islas Malvinas) +500","Gibraltar +350","Montserrat +1-664","Saint Helena +290","Turks and Caicos Islands +1-649","Northern Mariana Islands +1-670","Puerto Rico +1-787 and 1-939","American Samoa +1-684","Guam +1-671","U.S. Virgin Islands +1-340","Hong Kong +852","Macau +853","Faroe Islands +298","Greenland +299","French Guiana +594","Guadeloupe +590","Martinique +596","Reunion +262","Aland +358-18","Aruba +297","  Netherlands Antilles +599","Svalbard +47","Ascension +247","Tristan da Cunha +290","Kosovo +381","Palestinian Territories (Gaza Strip and West Bank) +970","Western Sahara +212"]
    
    @IBOutlet weak var ccPickerView: UIPickerView!
    @IBOutlet weak var container: UIView!
    weak var delegate : CountryCodePickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ccPickerView.delegate = self
        ccPickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    var currentCountryCode : String? {
        didSet {
            updatePickerCountryCode()
        }
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        self.init(nibName: "CountryCodeView", bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    
    private func updatePickerCountryCode() {
        if let _currentCC = self.currentCountryCode {
            if let _ccPicker = self.ccPickerView {
                //_ccPicker. = _currentCC
                for var index:Int = 0 ; index < pickerData.count ;index += 1{
                    var arr = pickerData[index].componentsSeparatedByString("+")
                    
                    if _currentCC == "\(arr[1])" {
                        _ccPicker.selectRow(index, inComponent: 0, animated: false)
                    }
                }
            }
        }
    }
    
    @IBAction func okButton_Click(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) {
            let selectedValue = self.pickerData[self.ccPickerView.selectedRowInComponent(0)]
            let cc = selectedValue.componentsSeparatedByString("+")
            self.delegate?.countryCodePickerVCDismissed("+\(cc[1])")
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
