/* jshint indent: 2 */

module.exports = function (sequelize, DataTypes) {
    return sequelize.define('Cohort', {
        tableName: "spa_vCohort",
        freezeTableName: true,

        cohortID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        description: {
            type: 'VARBINARY(255)',
            allowNull: true,
        },
        organizationID: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
        },
        tenantID: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        bSelectable: {
            type: DataTypes.INTEGER(4),
            allowNull: false,
            defaultValue: '1'
        },
        bActive: {
            type: DataTypes.INTEGER(4),
            allowNull: false,
            defaultValue: '1'
        },
        bPrivate: {
            type: DataTypes.INTEGER(4),
            allowNull: false,
            defaultValue: '0'
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
