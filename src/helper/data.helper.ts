'use strict';

const moment = require('moment');
require('moment/locale/pt-br');
moment.locale('pt-br');

export class DateTime {
  /**
   * Convert uma string para datetime.
   * @param {String} val - Formato esperado: dd/MM/yyyy or yyyy-mm-dd
   */
  static ToDateTime(val) {
    if (val.indexOf('/') > -1) {
      const data = val.split('/');

      return new Date(
        parseInt(data[2]),
        parseInt(data[1]) - 1,
        parseInt(data[0]),
      );
    } else if (val.indexOf('-') > -1) {
      const data = val.split('-');

      return new Date(
        parseInt(data[0]),
        parseInt(data[1]) - 1,
        parseInt(data[2]),
      );
    }

    throw new Error(`Data ${val} no formato inválido para conversão.`);
  }

  /**
   * Convert uma data para um formato especifico.
   * @param {Date} val
   */
  static ToFormat(val, format) {
    return moment(val)
      .utc()
      .format(format);
  }

  /**
   * Obtem a diferença "pura" entre datas.
   * @param {Date} inicial
   * @param {Date} final
   */
  static DateDiff(inicial, final) {
    return moment(final).diff(moment(inicial));
  }

  /**
   * Recupera a data atual com hora zerada.
   */
  static DateNow() {
    return DateTime.ToDateTime(
      moment()
        .utc()
        .format('DD/MM/YYYY'),
    );
  }

  /**
   * Recupera a data e hora atual com hora zerada.
   */
  static startOfDay() {
    return moment()
      .utc()
      .startOf('day');
  }

  /**
   * @param {Date} data
   * Recupera database atual
   */
  static getDataBase(data) {
    let month = moment(data).month();
    let year = moment(data).year();
    return ('0' + (month + 1)).slice(-2) + '/' + year;
  }

  /**
   * Subtrai dias em uma data.
   * @param {*} date
   * @param {*} day
   */
  static subtractDays(date, day) {
    return moment(date)
      .subtract('d', day)
      .utc()
      .toDate();
  }

  /**
   * Subtrai meses em uma data.
   * @param {*} date
   * @param {*} months
   */
  static subtractMonth(date, months) {
    return moment(date)
      .subtract(months, 'M')
      .utc()
      .toDate();
  }

  /**
   * Adiciona meses em uma data.
   * @param {*} date
   * @param {*} month
   */
  static AddMonth(date, month) {
    return moment(date)
      .add(month, 'month')
      .utc()
      .toDate();
  }

  /**
   * Adiciona dias em uma data.
   * @param {*} date
   * @param {*} day
   */
  static AddDay(date, day) {
    return moment(date)
      .add(day, 'day')
      .utc()
      .toDate();
  }

  /**
   * Verifica se as duas datas são iguais.
   * @param {*} inicial
   * @param {*} final
   */
  static EqualsDate(inicial, final) {
    return (
      moment(inicial)
        .utc()
        .format('DD/MM/YYYY') ===
      moment(final)
        .utc()
        .format('DD/MM/YYYY')
    );
  }

  /**
   * Obtem a data atual com base no locale moment.
   */
  static Now() {
    return moment()
      .utc()
      .toDate();
  }

  /**
   * Checa se é a mesma data
   */
  static isSameDay(date) {
    return moment(date)
      .utc()
      .isSame(new Date(), 'day');
  }

  /**
   * Date ToString.
   */
  static DateToString(date) {
    return moment(date)
      .utc()
      .format('DD/MM/YYYY');
  }

  /**
   * Date ToString.
   */
  static MonthYearToString(date) {
    return moment(date)
      .utc()
      .format('MM/YYYY');
  }

  /**
   * Date DD/MM/YYYY
   */
  static EndOfMonth(date) {
    let dateTime = this.ToDateTime(date);
    let formatDate = moment(dateTime);
    let fullYear = new Date(formatDate).getFullYear();
    let month = new Date(formatDate).getMonth();
    let lastDayDate = new Date(fullYear, month + 1, 0);
    return moment(lastDayDate)
      .utc()
      .format('YYYY-MM-DD');
  }

  /**
   * dataBase MM/YYYY
   */
  static DataBaseToString(date) {
    let dateTime = this.ToDateTime(date);
    let formatDate = moment(dateTime);
    return moment(formatDate)
      .utc()
      .format('YYYY-MM-DD');
  }

  /**
   * id - YYYYMMDDHHMMSSMS
   */
  static dateTimeAsId() {
    const data = new Date(new Date().getTime());
    const year = data.getFullYear();
    const m = data.getMonth() < 12 ? data.getMonth() + 1 : 1;
    const month = ('0' + m).slice(-2);
    const d = data.getDate();
    const day = ('0' + d).slice(-2);
    const h = data.getHours();
    const hours = ('0' + h).slice(-2);
    const min = data.getMinutes();
    const minutes = ('0' + min).slice(-2);
    const sec = data.getSeconds();
    const seconds = ('0' + sec).slice(-2);
    const mili = data.getMilliseconds();
    const ms = ('0' + mili).slice(-2);
    return parseInt(`${year}${month}${day}${hours}${minutes}${seconds}${ms}`);
  }

  /**
   * dataInicial DD/MM/YYYY >= dataFinal DD/MM/YYYY
   */
  static comparaMaior(dataInicial, dataFinal) {
    let i = this.ToDateTime(dataInicial);
    let f = this.ToDateTime(dataFinal);
    let inicio = moment(i);
    let fim = moment(f);
    if (moment(inicio).isSameOrAfter(fim)) {
      return true;
    }
    return false;
  }

  /**
   * dataInicial DD/MM/YYYY <= dataFinal DD/MM/YYYY
   */
  static comparaMenor(dataInicial, dataFinal) {
    let i = this.ToDateTime(dataInicial);
    let f = this.ToDateTime(dataFinal);
    let inicio = moment(i);
    let fim = moment(f);
    if (moment(inicio).isSameOrBefore(fim)) {
      return true;
    }
    return false;
  }

  /**
   * Obtem a diferença em horas entre datas.
   * @param {Date} inicial
   * @param {Date} final
   */
  static DateDiffHoras(inicial, final) {
    const diff = Math.abs(final.getTime() - inicial.getTime());
    const horas = Math.trunc(diff / (1000 * 60 * 60));
    return horas;
  }

  /**
   * Obtem a diferença em dias entre datas.
   * @param {Date} inicial
   * @param {Date} final
   */
  static DateDiffDias(inicial, final) {
    const diff = Math.abs(final.getTime() - inicial.getTime());
    const days = Math.trunc(diff / (1000 * 60 * 60 * 24));
    return days;
  }

  /**
   * Obtem a diferença em meses entre datas.
   * @param {Date} inicial
   * @param {Date} final
   */
  static DateDiffMeses(inicial, final) {
    let diminuiMes = inicial.getDate() > final.getDate() ? 1 : 0;
    let months;
    months = (final.getFullYear() - inicial.getFullYear()) * 12;
    months -= inicial.getMonth();
    months -= diminuiMes;
    months += final.getMonth();
    return months <= 0 ? 0 : months;
  }

  /**
   * Obtem a diferença em anos entre datas.
   * @param {Date} inicial
   * @param {Date} final
   */
  static DateDiffAnos(inicial, final) {
    let anos = final.getFullYear() - inicial.getFullYear();
    if (final.getMonth() < inicial.getMonth()) {
      //se não completou aniversário
      anos--;
    }
    return anos <= 0 ? 0 : anos;
  }

  /**
   * Calcula a idade
   * @param {Date} dataNascimento
   * @param {Date} dataDoCalculo (nulo para idade agora)
   */
  static idade(dataNascimento, dataDoCalculo) {
    if (!dataDoCalculo) {
      dataDoCalculo = new Date();
    }
    let diferencaAnos =
      dataDoCalculo.getFullYear() - dataNascimento.getFullYear();
    if (
      new Date(
        dataDoCalculo.getFullYear(),
        dataDoCalculo.getMonth(),
        dataDoCalculo.getDate(),
      ) <
      new Date(
        dataDoCalculo.getFullYear(),
        dataNascimento.getMonth(),
        dataNascimento.getDate(),
      )
    )
      diferencaAnos--;
    return diferencaAnos;
  }

  /**
   * Converte uma data do formato bancario para o formato datetime.
   * @param {String} value
   * @returns
   */
  static convertDateBankFormat(value) {
    const dia = value.substr(0, 2);
    const mes = value.substr(2, 2);
    let ano = value.substr(4, 4);

    ano = ano.length === 2 ? '20' + ano : ano;

    return this.ToDateTime(`${dia}/${mes}/${ano}`);
  }

  /**
   * Converte uma data do formato bancario para o formato datetime.
   * @param {String} value
   * @returns
   */
  static convertInverseDateBankFormat(value) {
    let ano = value.substr(0, 4);
    const mes = value.substr(4, 2);
    const dia = value.substr(6, 2);

    ano = ano.length === 2 ? '20' + ano : ano;

    return this.ToDateTime(`${dia}/${mes}/${ano}`);
  }

  /**
   * Obtem o primeiro dia do mês.
   *@param {String} dataBase - Format DD/MM/YYYY. Caso informado resultará no primeiro dia do mês da data informada.
   *@returns {Date}
   */
  static primeiroDiaMes(dataBase) {
    if (!dataBase)
      return this.ToDateTime(
        moment()
          .utc()
          .startOf('M')
          .format('DD/MM/YYYY'),
      );

    return this.ToDateTime(
      moment(`${dataBase} 00:00`, 'DD/MM/YYYY h:m')
        .utc()
        .startOf('M')
        .format('DD/MM/YYYY'),
    );
  }

  /**
   * Obtem o ultimo dia do mês.
   * @param {String} dataBase - Format DD/MM/YYYY. Caso informado resultará no ultimo dia do mês da data informada.
   *@returns {Date}
   */
  static ultimoDiaMes(dataBase) {
    if (!dataBase)
      return this.ToDateTime(
        moment()
          .utc()
          .endOf('M')
          .format('DD/MM/YYYY'),
      );

    return this.ToDateTime(
      moment(`${dataBase} 00:00`, 'DD/MM/YYYY h:m')
        .utc()
        .endOf('M')
        .format('DD/MM/YYYY'),
    );
  }

  /**
   * Estrai a data de um date em formato string.
   * @param {String} value Format 2022-05-10T00:00:00.000
   * @returns {String} DD/MM/YYYY
   */
  static extractDate(value) {
    value = (value || '').toString();
    if (value.indexOf('T') === -1) {
      return null;
    }

    const data = value.split('T')[0];
    const splited = data.split('-');
    return `${splited[2]}/${splited[1]}/${splited[0]}`;
  }

  /**
   * Calcula a data de vencimento a partir da regra de cobrança
   * @param {import("@prisma/client").adi_regra_cobranca} regraCobranca
   */
  static calcularVencimentoCobranca(regraCobranca) {
    let mes = new Date().getMonth() + 1;
    if (regraCobranca.dia_vencimento < new Date().getDate()) {
      mes = mes + 1;
    }

    return this.vencimentoCobranca(regraCobranca.dia_vencimento, mes);
  }

  /**
   * Obtem o vencimento da cobrança a partir do dia de vencimento.
   * @param {Number} diaVencimento
   * @param {Number} mes
   * @returns
   */
  static vencimentoCobranca(diaVencimento, mes) {
    return this.ToDateTime(
      `${diaVencimento.toString().padStart(2, '0')}/${mes
        .toString()
        .padStart(2, '0')}/${new Date().getFullYear()}`,
    );
  }

  /**
   * Adiciona horas em uma data.
   * @param {*} date
   * @param {*} hours
   */
  static AddHours(date, hours) {
    return moment(date)
      .add(hours, 'hour')
      .utc()
      .toDate();
  }

  /**
   *  Retorna um array de datas a partir da data inicial e
   *  final ex: ['11/10/2021','12/10/2021']
   * @param {dataInicial} *dd/mm/yyyy
   * @param {dataFinal} *dd/mm/yyyy
   * @returns
   */
  static getListadeData(dataInicial, dataFinal) {
    let dataList = [];
    let dataIgual = dataInicial === dataFinal ? true : false;
    let dataInicio = this.ToDateTime(dataInicial);
    let dataFim = this.ToDateTime(dataFinal);
    let diifData = this.DateDiffDias(dataInicio, dataFim);
    let dataAdd = dataInicial;

    if (!dataIgual) {
      for (let i = 0; i < diifData; i++) {
        let checkDataArr = !dataList.find(i => i !== dataAdd);
        if (checkDataArr) {
          dataList.push(dataAdd);
        }
        let dataFormtConvert = DateTime.ToDateTime(dataAdd);
        let dataAddDay = DateTime.AddDay(dataFormtConvert, 1);
        let newData = DateTime.DateToString(dataAddDay);
        dataList.push(newData);
        dataAdd = newData;
      }
    } else {
      dataList.push(new Date(dataAdd));
    }

    return dataList;
  }

  /* *************************************************************
    =====> INICIO: METODOS ANTIGOS CRIADOS PELO ALEX (Ainda em uso!)     */
  static createDate(dia, mes, ano) {
    let date = new Date(`${parseInt(ano)}-${parseInt(mes)}-${parseInt(dia)}`);
    return new Date(date.getFullYear(), date.getMonth(), date.getDate());
  }

  static convertSecondsToDate(seconds) {
    let date = new Date();
    date.setTime(seconds * 1000);
    return date;
  }

  /* =====> FIM: METODOS ANTIGOS CRIADOS PELO ALEX (Ainda em uso!)     */
}
