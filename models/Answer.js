/* jshint indent: 2 */

module.exports = function (sequelize, DataTypes) {
    return sequelize.define('Answer', {
        tableName: "spa_vAnswer",
        freezeTableName: true,

        answerID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        testID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        answerTypeID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        organizationID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        tenantID: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        value: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
        },
        createdAt: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: 'CURRENT_TIMESTAMP'
        },
        updatedAt: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: '0000-00-00 00:00:00'
        },
        createdBy: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        updatedBy: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        }
    });
};
