import 'package:envymusic/screens/mainscreens/library.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 12,
                            offset: Offset(0, 0),
                            color: Colors.white),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Image.asset(
                        "lib/assets/image/splash.png",
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Envy Music",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('1.0.0.'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0.0),
                child: Column(
                  children: [
                    Text(
                      "Envy Music Is An Awesome Music Player App Made With Flutter\nDo You Like Online Music Streaming, But Tired Of Low Quality Or Paid Subscriptions? Would You Like Feature-rich And User Friendly App For That?\n\nEnvy Music Is Created With The Purpose Of High Quality Music Streaming Experience On Your Smartphone Without Annoying Ads And Very Minimal Interface\n\nThis project is still in development and is released in BETA mode,\n this does not determine the final quality of the app.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, fontFamily: 'Jost'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Developer: Nikhil Chauhan",
                style: TextStyle(fontSize: 12, fontFamily: 'Jost'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Scaffold(
                              backgroundColor: Colors.black87,
                              body: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                        Text(
                                          "Last updated: October 24, 2022\n\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.\nInterpretation and Definitions Interpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\nDefinitions-\n\nFor the purposes of this Privacy Policy:\nAccount means a unique account created for You to access our Service or parts of our Service.\n\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where control means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\n\nApplication means the software program provided by the Company downloaded by You on any electronic device, named Envy Music\nCompany (referred to as either the Company, We, Us or Our in this Agreement) refers to Envy Music.\n\nCountry refers to: Haryana,  India\n\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\\nnPersonal Data is any information that relates to an identified or identifiable individual.\n\nService refers to the Application.\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\n\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\n\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.\nCollecting and Using Your Personal Data\n\nTypes of Data Collected\n\nPersonal Data\nWhile using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\nUsage Data:\n\nUsage Data is collected automatically when using the Service.\nUsage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.\n\nUse of Your Personal Data\n\nThe Company may use Personal Data for the following purposes:\n\nTo provide and maintain our Service, including to monitor the usage of our Service.\n\nTo manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n\nFor the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n\nTo contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n\nTo provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n\nTo manage Your requests: To attend and manage Your requests to Us.\n\nFor business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.\n\nFor other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.\n\nWe may share Your personal information in the following situations\n\nWith Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service,  to contact You.\n\nFor business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.\n\nWith Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.\n\nWith business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.\n\nWith other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.\n\nWith Your consent: We may disclose Your personal information for any other purpose with Your consent.\n\nRetention of Your Personal Data\n\nThe Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.\n\nTransfer of Your Personal Data\n\nYour information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.\n\nDelete Your Personal Data\n\nYou have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\nOur Service may give You the ability to delete certain information about You from within the Service.\n\nYou may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.\n\nPlease note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.\n\nDisclosure of Your Personal Data\nBusiness Transactions\n\nIf the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.\n\nLaw enforcement\n\nUnder certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).\nOther legal requirements\n\nThe Company may disclose Your Personal Data in the good faith belief that such action is necessary to:\nComply with a legal obligation\nProtect and defend the rights or property of the Company\nPrevent or investigate possible wrongdoing in connection with the Service\nProtect the personal safety of Users of the Service or the public\nProtect against legal liability\nSecurity of Your Personal Data\n\nThe security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.\nChildren's Privacy\n\nOur Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information.\n\nLinks to Other Websites\n\nOur Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit.\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\nChanges to this Privacy Policy\n\nWe may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the Last updated date at the top of this Privacy Policy.\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n\nContact Us\n\nIf you have any questions about this Privacy Policy, You can contact us:\n\nBy email: isedenlive@gmail.com\n\nBy phone: +919810942673",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showContactMe(context);
                    },
                    child: Text(
                      "Help & Feedback",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
