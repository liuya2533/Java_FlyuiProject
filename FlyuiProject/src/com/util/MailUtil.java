package com.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
     // �����˵� ���� �� ���루�滻Ϊ�Լ�����������룩
    // PS: ĳЩ���������Ϊ���������䱾������İ�ȫ�ԣ��� SMTP �ͻ��������˶������루�е������Ϊ����Ȩ�롱��, 
    //     ���ڿ����˶������������, ����������������ʹ������������루��Ȩ�룩��
    public static String myEmailAccount = "liuya522127@163.com";
    // �˴��������ǵ�������Ȩ�룬������������
    public static String myEmailPassword = "ly522127";

    // ����������� SMTP ��������ַ, ����׼ȷ, ��ͬ�ʼ���������ַ��ͬ, һ��(ֻ��һ��, ���Ǿ���)��ʽΪ: smtp.xxx.com
    // ����163����� SMTP ��������ַΪ: smtp.163.com
    public static String myEmailSMTPHost = "smtp.163.com";

    // �ռ������䣨�滻Ϊ�Լ�֪������Ч���䣬����ʱ���Ǽ��ɣ�
    public static String receiveMailAccount = "xxxxx@qq.com";

    public static void sendActiveMail(String receiveMailAccount,String mailActiveCode) throws Exception {
        // 1. ������������, ���������ʼ��������Ĳ�������
        Properties props = new Properties();                    // ��������
        props.setProperty("mail.transport.protocol", "smtp");   // ʹ�õ�Э�飨JavaMail�淶Ҫ��
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // �����˵������ SMTP ��������ַ
        props.setProperty("mail.smtp.auth", "true");            // ��Ҫ������֤

        // PS: ĳЩ���������Ҫ�� SMTP ������Ҫʹ�� SSL ��ȫ��֤ (Ϊ����߰�ȫ��, ����֧��SSL����, Ҳ�����Լ�����),
        //     ����޷������ʼ�������, ��ϸ�鿴����̨��ӡ�� log, ����������� ������ʧ��, Ҫ�� SSL ��ȫ���ӡ� �ȴ���,
        //     ������ /* ... */ ֮���ע�ʹ���, ���� SSL ��ȫ���ӡ�
        /*
        // SMTP �������Ķ˿� (�� SSL ���ӵĶ˿�һ��Ĭ��Ϊ 25, ���Բ�����, ��������� SSL ����,
        //                  ��Ҫ��Ϊ��Ӧ����� SMTP �������Ķ˿�, ����ɲ鿴��Ӧ�������İ���,
        //                  QQ�����SMTP(SLL)�˿�Ϊ465��587, ������������ȥ�鿴)
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        */

        // 2. �������ô����Ự����, ���ں��ʼ�����������
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);                                 // ����Ϊdebugģʽ, ���Բ鿴��ϸ�ķ��� log

        // 3. ����һ���ʼ�
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount, mailActiveCode);

        // 4. ���� Session ��ȡ�ʼ��������
        Transport transport = session.getTransport();

        // 5. ʹ�� �����˺� �� ���� �����ʼ�������, ������֤����������� message �еķ���������һ��, ���򱨴�
        // 
        //    PS_01: �ɰܵ��жϹؼ��ڴ�һ��, ������ӷ�����ʧ��, �����ڿ���̨�����Ӧʧ��ԭ��� log,
        //           ��ϸ�鿴ʧ��ԭ��, ��Щ����������᷵�ش������鿴�������͵�����, ���ݸ����Ĵ���
        //           ���͵���Ӧ�ʼ��������İ�����վ�ϲ鿴����ʧ��ԭ��
        //
        //    PS_02: ����ʧ�ܵ�ԭ��ͨ��Ϊ���¼���, ��ϸ������:
        //           (1) ����û�п��� SMTP ����;
        //           (2) �����������, ����ĳЩ���俪���˶�������;
        //           (3) ���������Ҫ�����Ҫʹ�� SSL ��ȫ����;
        //           (4) �������Ƶ��������ԭ��, ���ʼ��������ܾ�����;
        //           (5) ������ϼ��㶼ȷ������, ���ʼ���������վ���Ұ�����
        //
        //    PS_03: ��ϸ��log, ���濴log, ����log, ����ԭ����log��˵����
        transport.connect(myEmailAccount, myEmailPassword);

        // 6. �����ʼ�, �������е��ռ���ַ, message.getAllRecipients() ��ȡ�������ڴ����ʼ�����ʱ���ӵ������ռ���, ������, ������
        transport.sendMessage(message, message.getAllRecipients());

        // 7. �ر�����
        transport.close();
    }

    /**
     * ����һ��ֻ�����ı��ļ��ʼ�
     *
     * @param session �ͷ����������ĻỰ
     * @param sendMail ����������
     * @param receiveMail �ռ�������
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String mailActiveCode) throws Exception {
        // 1. ����һ���ʼ�
        MimeMessage message = new MimeMessage(session);
        // 2. From: ������
        message.setFrom(new InternetAddress(sendMail, "ly-fly", "UTF-8"));
        // 3. To: �ռ��ˣ��������Ӷ���ռ��ˡ����͡����ͣ�
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "���û��û�", "UTF-8"));
        // 4. Subject: �ʼ�����
        message.setSubject("�û���֤", "UTF-8");
        String activeUrl="http://localhost:8080//FlyuiProject/activeServlet?mailcode="+mailActiveCode;
        // 5. Content: �ʼ����ģ�����ʹ��html��ǩ��
        message.setContent("�𾴵��û������ã����˿Ƽ�����������������������伤��<a href="+activeUrl+" target='_blank'>"+activeUrl+"</a>", "text/html;charset=UTF-8");
        // 6. ���÷���ʱ��
        message.setSentDate(new Date());
        // 7. ��������
        message.saveChanges();
        return message;
    }
}