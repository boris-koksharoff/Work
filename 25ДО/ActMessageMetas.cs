using ExternalDocflows.Domain.Aggregates.Docflows.Transations;

namespace ExternalDocflows.Domain.Services.Act
{
    /// <summary>
    /// Мета для 25 документооборота АКТ (25 ДО).
    /// </summary>
    public class ActMessageMetas
    {
        /// <summary>
        /// Код документооборота АКТ.
        /// </summary>
        public const int DocflowCode = 25;

        /// <summary>
        /// Первичный документ.
        /// </summary>
        public static TransactionMeta Initial => new TransactionMeta(DocflowCode, 1, 1);

        /// <summary>
        /// Подтверждение даты отправки (ПДП).
        /// </summary>
        public static TransactionMeta ReceiptDateConfirmation => new TransactionMeta(DocflowCode, 5, 5);

        /// <summary>
        /// Извещение о получении (ИоП).
        /// </summary>
        public static TransactionMeta ReceiptConfirmation => new TransactionMeta(DocflowCode, 3, 2);

        /// <summary>
        /// Ответный титул (титул заказчика).
        /// </summary>
        public static TransactionMeta Acceptance => new TransactionMeta(DocflowCode, 4, 3);

        /// <summary>
        /// Уведомление об уточнении (УоУ).
        /// </summary>
        public static TransactionMeta Rejection => new TransactionMeta(DocflowCode, 4, 4);

        /// <summary>
        /// Предложение об аннулировании (ПоА).
        /// </summary>
        public static TransactionMeta CancellationProposal => new TransactionMeta(DocflowCode, 6, 6);

        /// <summary>
        /// Согласие с аннулированием.
        /// </summary>
        public static TransactionMeta CancellationAcceptance => new TransactionMeta(DocflowCode, 7, 6);

        /// <summary>
        /// Отказ от аннулирования (УоУ на аннулирование).
        /// </summary>
        public static TransactionMeta CancellationRejection => new TransactionMeta(DocflowCode, 7, 4);
    }
}
