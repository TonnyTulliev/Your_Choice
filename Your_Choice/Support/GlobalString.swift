//
//  GlobalString.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 09.02.2022.
//

import Foundation

final class GlobalString {
    
    // MARK: - Login and Registration
    static let startErrorLabel = NSLocalizedString("Неверный email или пароль", comment: "")
    static let registrationErrorLabel = NSLocalizedString("Поля заполненны некорректно", comment: "")
    static let emailTextFieldPH = NSLocalizedString("Email", comment: "")
    static let nameTextFieldPH = NSLocalizedString("Введите ваше имя", comment: "")
    static let passwordTextFieldPH = NSLocalizedString("Пароль", comment: "")
    static let repeatPasswordTextFieldPH = NSLocalizedString("Повторите пароль", comment: "")
    static let registerButton = NSLocalizedString("Зарегистрировать", comment: "")
    static let backButton = NSLocalizedString("Назад", comment: "")
    static let dataBaseError = NSLocalizedString("Ошибка с сохранением пользователя", comment: "")
    static let validationError = NSLocalizedString("Поля заполненны некорректно, проверьте данные", comment: "")
    static let passwordValidationError = NSLocalizedString("Введенные пароли несовпадают", comment: "")
   
    // MARK: - PlayersVC
    static let infoLabel = NSLocalizedString("Создайте от 2 до 4 игроков, выберите цвет и задайте имя.", comment: "")
    static let nextButton = NSLocalizedString("Выбрать задание", comment: "")
    static let alertAtention = NSLocalizedString("Внимание", comment: "")
    static let alertMinusInfo = NSLocalizedString("Необходимо минимум 2 игрока", comment: "")
    static let alertPlusInfo = NSLocalizedString("Достигнуто максимальное количество игроков", comment: "")
    static let taskActionAlert = NSLocalizedString("Недостаточное количество игроков", comment: "")
    static let alertOk = NSLocalizedString("OK", comment: "")
    static let barTitle = NSLocalizedString("Игроки", comment: "")
    static let barBackButton = NSLocalizedString("Выйти", comment: "")
    
    // MARK: - TaskVC
    static let infoTaskLabel = NSLocalizedString("Выберите задание", comment: "")
    static let nextTaskButton = NSLocalizedString("Далее", comment: "")
    static let alertTaskCreate = NSLocalizedString("Создайте задание", comment: "")
    static let tasks = NSLocalizedString("Задания", comment: "")
    
    // MARK: - GameVC
    static let headerLabel = NSLocalizedString("Задания для каждого игрока выделены его цветом, вы можете отсортировать задания нажав на иконку игрока", comment: "")
    static let startButton = NSLocalizedString("Начать", comment: "")
    
    // MARK: - Global
    static let players = NSLocalizedString("Игроки", comment: "")
    static let nameAndColor = NSLocalizedString("Выберите имя и цвет игрока", comment: "")
    static let playerSettings = NSLocalizedString("Настройка игрока", comment: "")
    static let playersNamePH = NSLocalizedString("Введите ваше имя", comment: "")
    static let taskSettings = NSLocalizedString("Настройка задания", comment: "")
    static let taskTextFieldPH = NSLocalizedString("Напишите задание", comment: "")
    static let doneButton = NSLocalizedString("Создать", comment: "")
    
    // MARK: - Color
    // MARK: - Task
    // MARK: - Image
    
}
