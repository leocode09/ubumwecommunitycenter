import 'package:flutter/material.dart';

import 'partner_card.dart';

class PartnersContent extends StatelessWidget {
  const PartnersContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? screenWidth : 800, // Constrain width on desktop
          ),
          child: const Column(
            children: [
              PartnerCard(
                title: 'Columbus Zoo and Partners In Conservation',
                imagePath: 'assets/ZOO.jpg',
                year: '2006',
                description:
                    'The Columbus Zoo and Partners in Conservation have been our main and leading donor since the UCC opened in 2006. In addition to the construction of our main center, they continue to fund the center\'s operating expenses, including special projects that improve the quality of services that we offer to our beneficiaries.',
              ),
              PartnerCard(
                title: 'Congregation B\'nai B\'rith',
                imagePath: 'assets/cbb.jpg',
                year: '2010',
                description:
                    'Since 2010, Congregation B\'nai B\'rith (CBB) together with the Santa Barbara community, has been the main donor and supporter for our inclusive pre-school and primary school. They have helped us realize our long-time dream to start an inclusive school. Since the construction of our pre-school facility in 2010, they continue to support our school in different ways: school supplies and other needs, especially school books, sponsoring children with special needs, supporting our school staff, and so much more.',
              ),
              PartnerCard(
                title: 'The Kramer/Galante Family',
                imagePath: 'assets/nancy.jpg',
                year: '2012',
                description:
                    'After the construction of our pre-school was completed in 2012, our inclusive education dream was not yet realized. We needed additional classrooms so that the inclusive education for our children could start in our pre-school and continue through Primary 6. Nancy Kramer\'s visit to the UCC in 2013 was such a blessing because her family decided to fund the construction of our primary school! The family continues to support various UCC programs.',
              ),
              PartnerCard(
                title: 'The Point Foundation',
                imagePath: 'assets/point.jpg', 
                year: '2012',
                description:
                    'Our association with the Point Foundation (PF) began in 2012, when they funded 46 Pwds from Noel Nyundo Orphanage to have daily therapies at our centre. PF then initiated a ‘Community Based Living’ program in 2013 for 26 PWDs left homeless after the Orphanage closed & worked closely with UCC to safeguard their futures. PF also kindly supported our Street Children program. Today PF funding covers some of our immediate needs such as purchasing Workshop equipment, Knitting, Sewing & Braille machines and 1,000’s of schoolbooks each year. They sponsor 92 special needs children with yearly school fees, uniforms, shoes, books, milk, lunch & transport & fund the annual salaries of 3 sign teachers & an Early Learning teacher at House of Children School. Their biggest commitment with UCC is the complete funding of our extension of services at Mwogo Vocational Training Centre, set up in 2018 & part of the Mwogo Integrated Development Program (MIDP) located in Bugesera District, Eastern Province. Their sustainable support is made possible by three of PF’s major donors: Teapigs Company, Caffe Praego Coffee Company and Mrs Jennifer Maslow & family. Funds enabled the initial refurbishment of premises & today they continue paying for our operating expenses, building rent, staff & teachers’ salaries, student’s lunches & training materials. In addition, PF have established an apiary & organic farming project in Mwogo, giving agricultural training to local PWD’s.',
              ),
              PartnerCard(
                title: 'Rwandan Futures',
                imagePath: 'assets/rwanda.jpg',
                year: '2016',
                description:
                    'Rwandan Futures has been working in partnership with the UCC since 2016 and currently partners with the UCC to implement three programmes: Inclusive Futures, UCC Mwogo and UCC Craft Business Development. Inclusive Futures involves working in partnership with 22 schools and 4 technical and vocational education and training institutions to enable 52 children and young adults with disabilities to receive an education that meets their individual needs and abilities. This includes the provision of medical support and prosthetic and other assistive devices. 25 of these children and young adult\'s families have been supported to start small income generation activities and businesses, as have 16 young adults with disabilities who have recently left school or training. Rwandan Futures has recently begun to support the UCC to purchase land and build a new branch of the UCC in Mwogo Sector, Bugesera District and also to help the UCC to develop its Rwandan craft production and business programme.',
              ),
              PartnerCard(
                title: 'A Better World Canada',
                imagePath: 'assets/better.jpg',
                year: '2018',
                description:
                    'A Better World Canada began partnering with the UCC by supporting medical treatment for beneficiaries who were unable to afford these services. In 2018, A Better World Canada funded the construction of our physiotherapy facility and the necessary equipment. A Better World Canada continues to support our physiotherapy services.',
              ),
              PartnerCard(
                title: 'The Woodburn family',
                imagePath: 'assets/wood.jpg',
                year: '2023',
                description:
                    'Due to increasing community demand for students to attend House of Children School, our classrooms were over capacity. We needed additional rooms to reduce the number of children in some classes. The Woodburn family funded the construction of two \'smart classrooms\' that are used for students in Primary 5.',
              ),
              PartnerCard(
                title: 'Robin and John Klein, Janice and Marshall Harrington Knopf, and friends from the Jersey Shore',
                imagePath: 'assets/robin.jpg',
                year: '2015',
                description:
                    'Each year this group of friends organizes a fundraising event for UCC programs, especially to support our skills program. This support includes sponsoring our Skills Training department, providing lunch for our students, and training supplies as they learn tailoring and sewing, knitting, or handicraft skills.',
              ),
              PartnerCard(
                title: 'The Edwards families',
                description:
                    'Once the construction of the inclusive school was finished, children with disabilities faced a huge challenge to reach our facility as most of them were unable to walk to school. This family funded the purchase of a bus to transport these students. They continue to fund the operating expenses of the bus that has to travel the bumpy, unpaved roads to transport these students. They also support the salaries of our physiotherapy services staff and support advanced medical treatment for at least six individuals who need surgeries and prosthetics.',
              ),
              PartnerCard(
                title: 'National Commission for Children and the National Council for People with Disability',
                imagePath: 'assets/ncpd.jpg',
                description:
                    'The government of Rwanda through the National Commission for Children (NCC), National Council for People with Disability (NCPD), and Rubuvu District have been very supportive of our daily activities and programs. In addition to their annual support that is used to provide health insurance for children with disabilities and education support, they have provided the land that was used for school construction and a vehicle that we use for our outreach programs. They have also provided a plot of land where we hope to expand our activities to other parts of Rubuvu District. The support of these government agencies encourages us and facilitates our community sensitization and awareness activities for people with disabilities. As a member of the Joint Action Development Forum (JADF), we have opportunities to connect and partner with other organizations, both local and international, who share our same mission.',
              ),
              PartnerCard(
                title: 'Rwanda Union for the Blind',
                description:
                    'Through the Rwanda Union for the Blind (RUB), vision impaired students from all over Rwanda arrive at the Ubumwe Community Center for vocational training and braille classes. RUB provides for the students\' basic needs, including meals and accommodation, while they receive training.',
              ),
              PartnerCard(
                title: 'Canyon Hills Presbyterian Church',
                description:
                    'Canyon Hills Presbyterian Church supports various special projects for the Center each year. This support includes: school supplies, wheelchairs, and other assistive devices for our beneficiaries. In addition to that support, church members come to the Center each year to assist us through volunteer work.',
              ),
              PartnerCard(
                title: 'Camphill Association of North America and Camphill Foundation',
                description:
                    'The Camphill Association of North America and Camphill Foundation have been very supportive during the COVID-19 pandemic. They have provided food to the families of our beneficiaries who could not work and earn a salary. They have also supported many of our staff, especially teachers at House of Children School who were receiving their funding from parents who were unable to pay their children\'s school fees.',
              ),
              PartnerCard(
                title: 'The Karl König Institute for Art, Science and Social Life',
                description:
                    'The Karl König Institute is a charitable organisation, registered in Berlin, Germany, with an office in North America and Scotland and linking to partners in other countries. It provides the legal basis for the work arising from the life and work of Dr. Karl König, founder of the Camphill Movement. Its tasks are to co-ordinate the work of the Karl König Archive. Also Cultural, scientific and social initiatives that are in accordance with the anthroposophic and holistic intentions of Karl König are encouraged and supported.\n\nThe aims of the Karl König Institute are:\n• preparation of a comprehensive new edition, making König\'s work available to the general public\n• establishment of subject areas to cooperate with professionals internationally in the process of editing Karl König\'s Literary Estate in twelve thematic sections\n• continuation of Karl König\'s research aims\n• to initiate and support publications and events related to these research areas\n• to encourage and implement international net-working and co-operation with initiatives and institutions working related aims',
              ),
              PartnerCard(
                title: 'YaraStar Foundation',
                description:
                    'With safety being an issue for some children with disabilities, we began receiving support for full time care and protection of 3 of our children. Since 2022 YaraStar Foundation, an international organization based in the US, began partnering with Ubumwe Community Center to support on-going care and safety as well as provide educational support and resources to some of our children. This partnership ensures these children receive the compassion, care and opportunities they deserve to thrive and reach their full God-given potential and is vital for the continued growth and success of our mission.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
